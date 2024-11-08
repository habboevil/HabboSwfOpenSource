﻿package com.sulake.habbo.catalog.clubcenter
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.catalog.offers.IOfferExtension;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.catalog.offers.IOfferCenter;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.ScrKickbackData;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDAvatarRenderManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.habbo.communication.messages.incoming.catalog.ClubGiftInfoEvent;
    import com.sulake.habbo.communication.messages.incoming.users.ScrSendKickbackInfoMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.badges.BadgesEvent;
    import com.sulake.habbo.session.events.BadgeImageReadyEvent;
    import com.sulake.habbo.communication.messages.parser.users.ScrSendKickbackInfoMessageParser;
    import flash.utils.getTimer;
    import com.sulake.habbo.communication.messages.parser.inventory.badges.BadgesParser;
    import com.sulake.habbo.catalog.clubcenter.util.BadgeResolver;
    import com.sulake.habbo.communication.messages.outgoing.inventory.badges.GetBadgesComposer;
    import com.sulake.habbo.communication.messages.outgoing.catalog.GetClubGiftInfo;
    import com.sulake.habbo.communication.messages.outgoing.users.ScrGetKickbackInfoMessageComposer;
    import com.sulake.habbo.catalog.purse.IPurse;
    import com.sulake.habbo.catalog.clubcenter.util.ClubStatus;
    import com.sulake.habbo.catalog.enum.CatalogPageName;
    import com.sulake.habbo.catalog.enum.CatalogType;
    import flash.display.Stage;
    import com.sulake.habbo.catalog.enum.ClubOfferRequestSource;
    import __AS3__.vec.*;

    public class HabboClubCenter extends Component implements ILinkEventTracker, IOfferExtension 
    {
        private static const USE_FAKE_DATA:Boolean = false;
        private static const DATA_UPDATE_INTERVAL_MSEC:int = 10000;

        private var _communicationManager:IHabboCommunicationManager;
        private var _localizationManager:IHabboLocalizationManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _avatarRenderManager:IAvatarRenderManager;
        private var _windowManager:IHabboWindowManager;
        private var _catalog:IHabboCatalog;
        private var _toolbar:IHabboToolbar;
        private var _offerCenter:IOfferCenter;
        private var _videoAvailable:Boolean = false;
        private var _messageEvents:Vector.<IMessageEvent>;
        private var _view:ClubCenterView;
        private var _breakdownView:ClubSpecialInfoBubbleView;
        private var _data:ScrKickbackData;
        private var _dataTimestamp:int;
        private var _dataPending:Boolean = false;
        private var _badgeId:String;
        private var _giftsAvailable:int;

        public function HabboClubCenter(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            this._dataTimestamp = -(DATA_UPDATE_INTERVAL_MSEC);
            super(k, _arg_2, _arg_3);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communicationManager = k;
            }, true), new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _sessionDataManager = k;
            }), new ComponentDependency(new IIDAvatarRenderManager(), function (k:IAvatarRenderManager):void
            {
                _avatarRenderManager = k;
            }), new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localizationManager = k;
            }), new ComponentDependency(new IIDHabboCatalog(), function (k:IHabboCatalog):void
            {
                _catalog = k;
            }), new ComponentDependency(new IIDHabboToolbar(), function (k:IHabboToolbar):void
            {
                _toolbar = k;
            })]));
        }

        override protected function initComponent():void
        {
            this._messageEvents = new Vector.<IMessageEvent>(0);
            this.addMessageEvent(new ClubGiftInfoEvent(this.onClubGiftInfo));
            this.addMessageEvent(new ScrSendKickbackInfoMessageEvent(this._Str_22489));
            this.addMessageEvent(new BadgesEvent(this.onBadges));
            context.addLinkEventTracker(this);
            if (((getBoolean("offers.enabled")) && (getBoolean("offers.habboclub.enabled"))))
            {
                this._offerCenter = this.catalog.getOfferCenter(this);
            }
        }

        override public function dispose():void
        {
            var k:IMessageEvent;
            if (((!(this._messageEvents == null)) && (!(this._communicationManager == null))))
            {
                for each (k in this._messageEvents)
                {
                    this._communicationManager.removeHabboConnectionMessageEvent(k);
                }
            }
            if (((!(this._sessionDataManager == null)) && (this._sessionDataManager.events)))
            {
                this._sessionDataManager.events.removeEventListener(BadgeImageReadyEvent.BIRE_BADGE_IMAGE_READY, this._Str_18469);
            }
            if (this._offerCenter != null)
            {
                this._offerCenter = null;
            }
            this.removeView();
            this._data = null;
            this._messageEvents = null;
            super.dispose();
        }

        public function get linkPattern():String
        {
            return "habboUI/";
        }

        public function linkReceived(k:String):void
        {
            var _local_2:Array = k.split("/");
            if (_local_2.length < 3)
            {
                return;
            }
            if (_local_2[1] == "open")
            {
                switch (_local_2[2])
                {
                    case "hccenter":
                        this._Str_23317();
                        return;
                }
            }
        }

        private function _Str_23317():void
        {
            if (!this._view)
            {
                this._view = new ClubCenterView(this, this._windowManager, this._sessionDataManager.figure);
            }
            if (this._Str_25344())
            {
                this.updateData();
            }
            else
            {
                this.populate();
            }
            if ((((this._offerCenter) && (this._view)) && (this._videoAvailable)))
            {
                this._videoAvailable = false;
                this._Str_14237(true);
            }
        }

        public function removeView():void
        {
            if (this._view)
            {
                this._view.dispose();
                this._view = null;
            }
            this.removeBreakdown();
            this._dataPending = false;
        }

        public function removeBreakdown():void
        {
            if (this._breakdownView)
            {
                this._breakdownView.dispose();
                this._breakdownView = null;
            }
        }

        private function addMessageEvent(k:IMessageEvent):void
        {
            if (!this._communicationManager)
            {
                return;
            }
            this._messageEvents.push(this._communicationManager.addHabboConnectionMessageEvent(k));
        }

        private function _Str_22489(k:ScrSendKickbackInfoMessageEvent):void
        {
            var _local_2:ScrSendKickbackInfoMessageParser = k.getParser();
            this._data = _local_2.data;
            this._dataPending = false;
            this._dataTimestamp = getTimer();
            this.populate();
        }

        private function onClubGiftInfo(k:ClubGiftInfoEvent):void
        {
            this._giftsAvailable = k.getParser()._Str_7574;
            this.populate();
        }

        private function _Str_18469(k:BadgeImageReadyEvent):void
        {
            if (((!(k.badgeId == this._badgeId)) || (!(this._sessionDataManager))))
            {
                return;
            }
            this._sessionDataManager.events.removeEventListener(BadgeImageReadyEvent.BIRE_BADGE_IMAGE_READY, this._Str_18469);
            this.populate();
        }

        public function onBadges(k:IMessageEvent):void
        {
            var _local_2:BadgesParser = (k as BadgesEvent).getParser();
            this._badgeId = ((BadgeResolver._Str_25437(_local_2.getAllBadgeCodes())) || (BadgeResolver._Str_16636));
        }

        private function _Str_25344():Boolean
        {
            return (!(this._dataPending)) && ((getTimer() - this._dataTimestamp) > DATA_UPDATE_INTERVAL_MSEC);
        }

        private function updateData():void
        {
            this._dataPending = true;
            this._communicationManager.connection.send(new GetBadgesComposer());
            this._communicationManager.connection.send(new GetClubGiftInfo());
            if (!USE_FAKE_DATA)
            {
                this._communicationManager.connection.send(new ScrGetKickbackInfoMessageComposer());
            }
            else
            {
                this._data = new ScrKickbackData();
                this.populate();
            }
        }

        private function populate():void
        {
            if (this._view)
            {
                this._view._Str_22518(this._data, this.getPurse(), this._Str_22760(), BadgeResolver._Str_24209(this._badgeId, this._Str_18469, this._sessionDataManager));
            }
        }

        private function get catalog():IHabboCatalog
        {
            return this._catalog;
        }

        private function getPurse():IPurse
        {
            return (this.catalog != null) ? this.catalog.getPurse() : null;
        }

        private function _Str_22760():int
        {
            return this._giftsAvailable;
        }

        public function get localization():IHabboLocalizationManager
        {
            return (this.catalog != null) ? this.catalog.localization : null;
        }

        public function get avatarRenderManager():IAvatarRenderManager
        {
            return this._avatarRenderManager;
        }

        public function _Str_24259():String
        {
            if (!this.catalog)
            {
                return ClubStatus.NONE;
            }
            var k:IPurse = this.getPurse();
            if (k.clubDays > 0)
            {
                return ClubStatus.ACTIVE;
            }
            if (((k.pastClubDays > 0) || (k.pastVipDays > 0)))
            {
                return ClubStatus.EXPIRED;
            }
            return ClubStatus.NONE;
        }

        public function _Str_24472():void
        {
            if (this.catalog)
            {
                this.catalog.openCatalogPage(CatalogPageName.HC_MEMBERSHIP, CatalogType.NORMAL);
            }
        }

        public function _Str_22271():void
        {
            if (this.catalog)
            {
                this.catalog.openCatalogPage(CatalogPageName.CLUB_GIFTS, CatalogType.NORMAL);
            }
        }

        public function _Str_23974():void
        {
            if (this._breakdownView)
            {
                this.removeBreakdown();
                return;
            }
            this._breakdownView = new ClubSpecialInfoBubbleView(this, this._windowManager, this._data, this._view._Str_23883());
        }

        public function _Str_21087():void
        {
            context.createLinkEvent("habbopages/hcpayday");
        }

        public function openHelpPage():void
        {
            context.createLinkEvent("habbopages/habboclub");
        }

        public function _Str_26228(k:String):void
        {
            context.createLinkEvent(k);
        }

        public function _Str_21512():Boolean
        {
            var k:String = getProperty("hccenter.activity.enabled");
            if (((k == null) || (k == "")))
            {
                return true;
            }
            return (k == "1") || (k == "true");
        }

        public function get stage():Stage
        {
            return ((context) && (context.displayObjectContainer)) ? context.displayObjectContainer.stage : null;
        }

        public function _Str_16489():void
        {
            this._catalog.getHabboClubOffers(ClubOfferRequestSource._Str_19022);
        }

        public function get _Str_19407():IOfferCenter
        {
            return this._offerCenter;
        }

        public function _Str_18053():void
        {
        }

        public function _Str_14237(k:Boolean):void
        {
            if (this._view)
            {
                this._view._Str_24836(k, ((!(this._offerCenter == null)) && (!(this._offerCenter._Str_16243))));
            }
            else
            {
                this._videoAvailable = k;
            }
        }
    }
}
