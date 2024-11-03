﻿package com.sulake.habbo.sound.trax
{
    import __AS3__.vec.Vector;

    public class TraxChannelSample 
    {
        private var _sample:TraxSample = null;
        private var _offset:int = 0;

        public function TraxChannelSample(k:TraxSample, _arg_2:int)
        {
            this._sample = k;
            this._offset = _arg_2;
        }

        public function setSample(k:Vector.<int>, _arg_2:int, _arg_3:int):void
        {
            this._offset = this._sample.setSample(k, _arg_2, _arg_3, this._offset);
        }

        public function addSample(k:Vector.<int>, _arg_2:int, _arg_3:int):void
        {
            this._offset = this._sample.addSample(k, _arg_2, _arg_3, this._offset);
        }
    }
}
