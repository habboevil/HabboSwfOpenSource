//com.sulake.habbo.communication.messages.outgoing.users.RespectUserMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class RespectUserMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function RespectUserMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

