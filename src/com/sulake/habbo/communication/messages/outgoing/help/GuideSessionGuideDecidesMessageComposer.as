﻿package com.sulake.habbo.communication.messages.outgoing.help
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class GuideSessionGuideDecidesMessageComposer implements IMessageComposer, IDisposable
    {
        private var _array:Array;
        private var _disposed:Boolean = false;

        public function GuideSessionGuideDecidesMessageComposer(k:Boolean)
        {
            this._array = [];
            super();
            this._array.push(k);
        }

        public function getMessageArray():Array
        {
            return this._array;
        }

        public function dispose():void
        {
            this._array = null;
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }
    }
}
