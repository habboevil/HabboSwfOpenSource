//com.sulake.habbo.communication.messages.outgoing.moderator.ModKickMessageComposer

package com.sulake.habbo.communication.messages.outgoing.moderator{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class ModKickMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function ModKickMessageComposer(k:int, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.moderator

