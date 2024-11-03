﻿package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ChatReviewSessionOfferedToGuideMessageParser implements IMessageParser
    {
        private var _acceptanceTimeout:int;


        public function flush():Boolean
        {
            this._acceptanceTimeout = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._acceptanceTimeout = k.readInteger();
            return true;
        }

        public function get _Str_23730():int
        {
            return this._acceptanceTimeout;
        }
    }
}
