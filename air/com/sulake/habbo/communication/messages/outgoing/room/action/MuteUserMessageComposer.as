//com.sulake.habbo.communication.messages.outgoing.room.action.MuteUserMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.action{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class MuteUserMessageComposer implements IMessageComposer {

        private var _userId:int;
        private var _roomId:int;
        private var _muteDuration:int;

        public function MuteUserMessageComposer(k:int, _arg_2:int, _arg_3:int=0);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.action

