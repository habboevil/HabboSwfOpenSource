﻿package com.sulake.habbo.communication.messages.incoming.navigator
{
    public class RoomThumbnailObjectData
    {
        private var _Str_6304:int;
        private var _Str_12644:int;


        public function _Str_20539():RoomThumbnailObjectData
        {
            var k:RoomThumbnailObjectData = new RoomThumbnailObjectData();
            k._Str_6304 = this._Str_6304;
            k._Str_12644 = this._Str_12644;
            return k;
        }

        public function set _Str_12651(k:int):void
        {
            this._Str_6304 = k;
        }

        public function set _Str_13964(k:int):void
        {
            this._Str_12644 = k;
        }

        public function get _Str_12651():int
        {
            return this._Str_6304;
        }

        public function get _Str_13964():int
        {
            return this._Str_12644;
        }
    }
}
