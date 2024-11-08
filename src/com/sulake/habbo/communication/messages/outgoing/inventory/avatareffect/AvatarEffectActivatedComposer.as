﻿package com.sulake.habbo.communication.messages.outgoing.inventory.avatareffect
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class AvatarEffectActivatedComposer implements IMessageComposer
    {
        private var _type:int;

        public function AvatarEffectActivatedComposer(k:int)
        {
            this._type = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            var k:Array = new Array();
            k.push(this._type);
            return k;
        }
    }
}
