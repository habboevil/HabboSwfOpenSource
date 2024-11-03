﻿package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.help.data.PendingGuideTicket;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuideReportingStatusMessageParser implements IMessageParser
    {
        public static const GUIDE_REPORTING_STATUS_OK:int = 0;
        public static const GUIDE_REPORTING_STATUS_PENDING_TICKET:int = 1;
        public static const GUIDE_REPORTING_STATUS_ABUSIVE:int = 2;
        public static const GUIDE_REPORTING_STATUS_REPORTING_TOO_QUICKLY:int = 3;

        private var _statusCode:int;
        private var _pendingTicket:PendingGuideTicket;


        public function flush():Boolean
        {
            this._pendingTicket = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._statusCode = k.readInteger();
            if (this._statusCode == GUIDE_REPORTING_STATUS_PENDING_TICKET)
            {
                this._pendingTicket = new PendingGuideTicket(k);
            }
            return true;
        }

        public function get statusCode():int
        {
            return this._statusCode;
        }

        public function get pendingTicket():PendingGuideTicket
        {
            return this._pendingTicket;
        }

        public function get localizationCode():String
        {
            switch (this._statusCode)
            {
                case GUIDE_REPORTING_STATUS_ABUSIVE:
                    return "blocked";
                case GUIDE_REPORTING_STATUS_REPORTING_TOO_QUICKLY:
                    return "tooquick";
                default:
                    return "";
            }
        }
    }
}
