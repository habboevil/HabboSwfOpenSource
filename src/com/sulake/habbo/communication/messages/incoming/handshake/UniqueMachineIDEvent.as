﻿package com.sulake.habbo.communication.messages.incoming.handshake
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake.UniqueMachineIDParser;

    public class UniqueMachineIDEvent extends MessageEvent implements IMessageEvent 
    {
        public function UniqueMachineIDEvent(k:Function)
        {
            super(k, UniqueMachineIDParser);
        }

        private function getParser():UniqueMachineIDParser
        {
            return this._parser as UniqueMachineIDParser;
        }

        public function get machineID():String
        {
            return this.getParser().machineID;
        }
    }
}
