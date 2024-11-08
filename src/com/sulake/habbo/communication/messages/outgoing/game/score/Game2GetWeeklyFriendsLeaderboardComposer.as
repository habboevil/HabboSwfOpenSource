﻿package com.sulake.habbo.communication.messages.outgoing.game.score
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class Game2GetWeeklyFriendsLeaderboardComposer implements IMessageComposer
    {
        private var _data:Array;

        public function Game2GetWeeklyFriendsLeaderboardComposer(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int)
        {
            this._data = [];
            super();
            this._data.push(k);
            this._data.push(_arg_2);
            this._data.push(_arg_3);
            this._data.push(_arg_4);
            this._data.push(_arg_5);
            this._data.push(_arg_6);
        }

        public function getMessageArray():Array
        {
            return this._data;
        }

        public function dispose():void
        {
            this._data = null;
        }
    }
}
