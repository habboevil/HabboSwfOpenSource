﻿package com.sulake.habbo.communication.messages.outgoing.competition
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetSecondsUntilMessageComposer implements IMessageComposer
    {
        private var _data:Array;

        public function GetSecondsUntilMessageComposer(k:String)
        {
            this._data = [];
            super();
            this._data.push(k);
        }

        public function getMessageArray():Array
        {
            return this._data;
        }

        public function dispose():void
        {
            this._data = null;
        }
    }
}
