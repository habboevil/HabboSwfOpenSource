﻿package com.sulake.habbo.communication.messages.outgoing.navigator
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class GetUserFlatCatsMessageComposer implements IMessageComposer, IDisposable
    {
        private var _array:Array;

        public function GetUserFlatCatsMessageComposer()
        {
            this._array = new Array();
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

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
