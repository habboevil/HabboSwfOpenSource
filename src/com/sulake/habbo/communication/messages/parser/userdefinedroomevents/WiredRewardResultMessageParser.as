﻿package com.sulake.habbo.communication.messages.parser.userdefinedroomevents
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class WiredRewardResultMessageParser implements IMessageParser
    {
        private var _reason:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._reason = k.readInteger();
            return true;
        }

        public function get reason():int
        {
            return this._reason;
        }
    }
}
