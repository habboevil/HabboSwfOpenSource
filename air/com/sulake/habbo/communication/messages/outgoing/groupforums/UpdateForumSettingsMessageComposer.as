//com.sulake.habbo.communication.messages.outgoing.groupforums.UpdateForumSettingsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.groupforums{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class UpdateForumSettingsMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function UpdateForumSettingsMessageComposer(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.groupforums

