﻿package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
    {
        public static const RWSDUE_STICKIE_DATA:String = "RWSDUE_STICKIE_DATA";

        private var _objectId:int = -1;
        private var _objectType:String;
        private var _text:String;
        private var _colorHex:String;
        private var _controller:Boolean;

        public function RoomWidgetStickieDataUpdateEvent(k:String, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:Boolean, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(k, _arg_7, _arg_8);
            this._objectId = _arg_2;
            this._objectType = _arg_3;
            this._text = _arg_4;
            this._colorHex = _arg_5;
            this._controller = _arg_6;
        }

        public function get objectId():int
        {
            return this._objectId;
        }

        public function get objectType():String
        {
            return this._objectType;
        }

        public function get text():String
        {
            return this._text;
        }

        public function get _Str_10471():String
        {
            return this._colorHex;
        }

        public function get controller():Boolean
        {
            return this._controller;
        }
    }
}
