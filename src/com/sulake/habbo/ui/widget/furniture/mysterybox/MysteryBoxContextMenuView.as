﻿package com.sulake.habbo.ui.widget.furniture.mysterybox
{
    import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextInfoView;
    import com.sulake.habbo.ui.widget.contextmenu.IContextMenuParentWidget;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextMenuWidget;
    import com.sulake.core.window.events.WindowEvent;

    public class MysteryBoxContextMenuView extends FurnitureContextInfoView 
    {
        private var _isOwnerMode:Boolean;

        public function MysteryBoxContextMenuView(k:IContextMenuParentWidget)
        {
            super(k);
        }

        override protected function updateWindow():void
        {
            var k:XML;
            var _local_2:IWindow;
            if ((((_widget == null) || (_widget.assets == null)) || (_widget.windowManager == null)))
            {
                return;
            }
            if (_Str_3452)
            {
                activeView = _Str_3113();
            }
            else
            {
                if (((_window == null) || (_window.disposed)))
                {
                    k = (_widget.assets.getAssetByName("mysterybox_menu").content as XML);
                    _window = (_widget.windowManager.buildFromXML(k, 0) as IWindowContainer);
                    if (_window == null)
                    {
                        return;
                    }
                    _window.addEventListener(WindowMouseEvent.OVER, _Str_2743);
                    _window.addEventListener(WindowMouseEvent.OUT, _Str_2743);
                    _local_2 = _window.findChildByName("minimize");
                    if (_local_2 != null)
                    {
                        _local_2.addEventListener(WindowMouseEvent.CLICK, _Str_4457);
                        _local_2.addEventListener(WindowMouseEvent.OVER, _Str_3052);
                        _local_2.addEventListener(WindowMouseEvent.OUT, _Str_3052);
                    }
                }
                _window.findChildByName("buttons").procedure = this.buttonEventProc;
                _window.visible = false;
                activeView = _window;
                _Str_3196 = false;
                this._Str_22004();
            }
        }

        private function _Str_22004():void
        {
            if (_window == null)
            {
                return;
            }
            _window.findChildByName("label").caption = (("${mysterybox.context." + ((this._isOwnerMode) ? "owner" : "other")) + ".use}");
        }

        override protected function buttonEventProc(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_4:FurnitureContextMenuWidget;
            if ((((disposed) || (_window == null)) || (_window.disposed)))
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
                        case "use":
                            _local_4 = (_widget as FurnitureContextMenuWidget);
                            if (_local_4 != null)
                            {
                                _local_4._Str_20629(_Str_2731);
                            }
                            break;
                    }
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

        public function set _Str_23546(k:Boolean):void
        {
            this._isOwnerMode = k;
            this._Str_22004();
        }
    }
}
