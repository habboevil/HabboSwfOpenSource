//com.sulake.habbo.communication.messages.outgoing.help.ChatReviewSessionCreateMessageComposer

package com.sulake.habbo.communication.messages.outgoing.help{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class ChatReviewSessionCreateMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function ChatReviewSessionCreateMessageComposer(k:int, _arg_2:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.help

