﻿package com.sulake.habbo.communication.messages.parser.friendlist
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FollowFriendFailedMessageParser implements IMessageParser
    {
        private var _errorCode:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._errorCode = k.readInteger();
            return true;
        }

        public function get errorCode():int
        {
            return this._errorCode;
        }
    }
}