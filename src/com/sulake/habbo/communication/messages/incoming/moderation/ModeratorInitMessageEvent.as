﻿package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.ModeratorInitMessageParser;

    public class ModeratorInitMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function ModeratorInitMessageEvent(k:Function)
        {
            super(k, ModeratorInitMessageParser);
        }

        public function getParser():ModeratorInitMessageParser
        {
            return _parser as ModeratorInitMessageParser;
        }
    }
}
