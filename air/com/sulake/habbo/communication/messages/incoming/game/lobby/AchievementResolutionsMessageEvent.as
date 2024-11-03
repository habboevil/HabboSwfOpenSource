//com.sulake.habbo.communication.messages.incoming.game.lobby.AchievementResolutionsMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.lobby{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.AchievementResolutionsMessageParser;

    [SecureSWF(rename="true")]
    public class AchievementResolutionsMessageEvent extends MessageEvent implements IMessageEvent {

        public function AchievementResolutionsMessageEvent(k:Function);

        public function getParser():AchievementResolutionsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.lobby

