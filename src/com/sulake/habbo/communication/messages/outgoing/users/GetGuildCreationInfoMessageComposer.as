﻿package com.sulake.habbo.communication.messages.outgoing.users
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetGuildCreationInfoMessageComposer implements IMessageComposer
    {
        private var _array:Array;

        public function GetGuildCreationInfoMessageComposer()
        {
            this._array = [];
            super();
        }

        public function getMessageArray():Array
        {
            return this._array;
        }

        public function dispose():void
        {
            this._array = null;
        }
    }
}
