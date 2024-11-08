﻿package com.sulake.habbo.communication.messages.outgoing.game.directory
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class Game2GetAccountGameStatusMessageComposer implements IMessageComposer
    {
        private var _data:Array;

        public function Game2GetAccountGameStatusMessageComposer(k:int)
        {
            this._data = [];
            super();
            this._data.push(k);
        }

        public function getMessageArray():Array
        {
            return this._data;
        }

        public function dispose():void
        {
        }
    }
}
