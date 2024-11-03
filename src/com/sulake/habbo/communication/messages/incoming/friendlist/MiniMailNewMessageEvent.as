﻿package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.MiniMailNewMessageMessageParser;

    public class MiniMailNewMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function MiniMailNewMessageEvent(k:Function)
        {
            super(k, MiniMailNewMessageMessageParser);
        }

        public function getParser():MiniMailNewMessageMessageParser
        {
            return _parser as MiniMailNewMessageMessageParser;
        }
    }
}
