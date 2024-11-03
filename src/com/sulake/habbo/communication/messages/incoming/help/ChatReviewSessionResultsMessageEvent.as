﻿package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.ChatReviewSessionResultsMessageParser;

    public class ChatReviewSessionResultsMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function ChatReviewSessionResultsMessageEvent(k:Function)
        {
            super(k, ChatReviewSessionResultsMessageParser);
        }

        public function getParser():ChatReviewSessionResultsMessageParser
        {
            return _parser as ChatReviewSessionResultsMessageParser;
        }
    }
}
