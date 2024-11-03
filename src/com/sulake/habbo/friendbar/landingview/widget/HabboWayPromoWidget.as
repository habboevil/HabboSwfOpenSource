﻿package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalProgressMessageEvent;
    import com.sulake.habbo.communication.messages.outgoing.quest.GetCommunityGoalProgressMessageComposer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class HabboWayPromoWidget implements ILandingViewWidget 
    {
        private var _landingView:HabboLandingView;
        private var _container:IWindowContainer;
        private var _completions:int;

        public function HabboWayPromoWidget(k:HabboLandingView)
        {
            this._landingView = k;
        }

        public function get container():IWindow
        {
            return this._container;
        }

        public function dispose():void
        {
            this._landingView = null;
            this._container = null;
        }

        public function initialize():void
        {
            this._container = IWindowContainer(this._landingView.getXmlWindow("habbo_way_promo"));
            this._container.findChildByName("go_button").procedure = this.onGoButton;
            this._landingView.communicationManager.addHabboConnectionMessageEvent(new CommunityGoalProgressMessageEvent(this.onCommunityGoalProgress));
        }

        public function refresh():void
        {
            this._landingView.send(new GetCommunityGoalProgressMessageComposer());
            this.refreshContent();
        }

        public function get disposed():Boolean
        {
            return this._landingView == null;
        }

        private function onGoButton(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._landingView.habboHelp.showHabboWay();
            }
        }

        private function onCommunityGoalProgress(k:CommunityGoalProgressMessageEvent):void
        {
            this._completions = k.getParser().data._Str_12030;
            this.refreshContent();
        }

        private function refreshContent():void
        {
            var k:String = ("" + this._completions);
            while (k.length < 8)
            {
                k = ("0" + k);
            }
            this._container.findChildByName("counter_txt").caption = k;
        }
    }
}

