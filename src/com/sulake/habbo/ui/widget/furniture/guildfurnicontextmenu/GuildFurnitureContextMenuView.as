﻿package com.sulake.habbo.ui.widget.furniture.guildfurnicontextmenu
{
    import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextInfoView;
    import com.sulake.habbo.groups.IHabboGroupsManager;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.ui.widget.contextmenu.IContextMenuParentWidget;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.runtime.Component;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextMenuWidget;

    public class GuildFurnitureContextMenuView extends FurnitureContextInfoView 
    {
        protected var _Str_17990:IHabboGroupsManager;
        protected var _windowManager:IHabboWindowManager;
        public var _guildId:int = -1;
        public var _Str_8815:int = -1;
        public var _Str_7536:Boolean = false;
        public var _Str_9506:Boolean = false;

        public function GuildFurnitureContextMenuView(k:IContextMenuParentWidget, _arg_2:IHabboGroupsManager, _arg_3:IHabboWindowManager)
        {
            super(k);
            _Str_3403 = false;
            this._Str_17990 = _arg_2;
            this._windowManager = _arg_3;
        }

        override public function dispose():void
        {
            this._Str_17990 = null;
            this._windowManager = null;
            super.dispose();
        }

        override protected function updateWindow():void
        {
            var _local_1:IRegionWindow;
            var k:XML;
            if ((((!(_widget)) || (!(_widget.assets))) || (!(_widget.windowManager))))
            {
                return;
            }
            if (_Str_3452)
            {
                activeView = _Str_3113();
            }
            else
            {
                if (!_window)
                {
                    k = (XmlAsset(_widget.assets.getAssetByName("guild_furni_menu")).content as XML);
                    _window = (_widget.windowManager.buildFromXML(k, 0) as IWindowContainer);
                    if (!window)
                    {
                        return;
                    }
                    _window.addEventListener(WindowMouseEvent.OVER, _Str_2743);
                    _window.addEventListener(WindowMouseEvent.OUT, _Str_2743);
                    _window.findChildByName("minimize").addEventListener(WindowMouseEvent.CLICK, _Str_4457);
                    _window.findChildByName("minimize").addEventListener(WindowMouseEvent.OVER, _Str_3052);
                    _window.findChildByName("minimize").addEventListener(WindowMouseEvent.OUT, _Str_3052);
                }
                _buttons = (window.findChildByName("buttons") as IItemListWindow);
                _buttons.procedure = this.buttonEventProc;
                _local_1 = (window.findChildByName("profile_link") as IRegionWindow);
                if (_local_1)
                {
                    _local_1.procedure = this.buttonEventProc;
                    _local_1.toolTipCaption = this.widget.localizations.getLocalization("infostand.profile.link.tooltip", "Click to view profile");
                    _local_1._Str_3099 = 100;
                }
                _window.findChildByName("name").caption = _title;
                _window.visible = false;
                activeView = _window;
                this._Str_2771();
                _Str_3196 = false;
            }
        }

        protected function _Str_2771():void
        {
            if (((!(_window)) || (!(_buttons))))
            {
                return;
            }
            _buttons.autoArrangeItems = false;
            showButton("join", (!(this._Str_7536)), true);
            showButton("open_forum", this._Str_9506, true);
            _buttons.autoArrangeItems = true;
            _buttons.visible = true;
        }

        override protected function buttonEventProc(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_4:Component;
            if (disposed)
            {
                return;
            }
            if (((!(_window)) || (_window.disposed)))
            {
                return;
            }
            var _local_3:Boolean;
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (_arg_2.name == "button")
                {
                    switch (_arg_2.parent.name)
                    {
                        case "join":
                            this.widget.handler._Str_24943(this._guildId);
                            showButton("join", (!(this._Str_7536)), false);
                            break;
                        case "home_room":
                            this.widget.handler._Str_24389(this._Str_8815);
                            break;
                        case "open_forum":
                            if (((!(this.widget == null)) && (!(this.widget.roomEngine == null))))
                            {
                                _local_4 = (this.widget.roomEngine as Component);
                                if (_local_4.context != null)
                                {
                                    _local_4.context.createLinkEvent(("groupforum/" + this._guildId));
                                    break;
                                }
                            }
                    }
                }
                if (_arg_2.name == "profile_link")
                {
                    this._Str_17990.openGroupInfo(this._guildId);
                }
                _local_3 = true;
            }
            else
            {
                super.buttonEventProc(k, _arg_2);
            }
            if (_local_3)
            {
                _widget.removeView(this, false);
            }
        }

        private function get widget():FurnitureContextMenuWidget
        {
            return _widget as FurnitureContextMenuWidget;
        }
    }
}
