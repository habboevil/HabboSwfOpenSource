﻿package com.sulake.habbo.communication.messages.outgoing.friendlist
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetFriendRequestsMessageComposer implements IMessageComposer
    {
        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return new Array();
        }
    }
}
