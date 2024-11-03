﻿package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users.HabboGroupEntryData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuildMembershipsMessageParser implements IMessageParser
    {
        private var _guilds:Array;

        public function GuildMembershipsMessageParser()
        {
            this._guilds = new Array();
            super();
        }

        public function flush():Boolean
        {
            this._guilds = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._guilds.push(new HabboGroupEntryData(k));
                _local_3++;
            }
            return true;
        }

        public function get guilds():Array
        {
            return this._guilds;
        }
    }
}
