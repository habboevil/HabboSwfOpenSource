﻿package com.sulake.habbo.sound.music
{
    import flash.utils.getTimer;

    public class SongStartRequestData 
    {
        private var _songId:int;
        private var _startPos:Number;
        private var _playLength:Number;
        private var _playRequestTime:int;
        private var _fadeInSeconds:Number;
        private var _fadeOutSeconds:Number;

        public function SongStartRequestData(k:int, _arg_2:Number, _arg_3:Number, _arg_4:Number=2, _arg_5:Number=1)
        {
            this._songId = k;
            this._startPos = _arg_2;
            this._playLength = _arg_3;
            this._fadeInSeconds = _arg_4;
            this._fadeOutSeconds = _arg_5;
            this._playRequestTime = getTimer();
        }

        public function get songId():int
        {
            return this._songId;
        }

        public function get startPos():Number
        {
            if (this._startPos < 0)
            {
                return 0;
            }
            return this._startPos + ((getTimer() - this._playRequestTime) / 1000);
        }

        public function get playLength():Number
        {
            return this._playLength;
        }

        public function get fadeInSeconds():Number
        {
            return this._fadeInSeconds;
        }

        public function get fadeOutSeconds():Number
        {
            return this._fadeOutSeconds;
        }
    }
}
