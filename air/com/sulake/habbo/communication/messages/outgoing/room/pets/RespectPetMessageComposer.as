//com.sulake.habbo.communication.messages.outgoing.room.pets.RespectPetMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.pets{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class RespectPetMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function RespectPetMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.pets

