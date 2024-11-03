﻿package com.sulake.habbo.sound.music
{
    import com.sulake.habbo.communication.messages.incoming.sound.PlayListEntry;
    import com.sulake.habbo.sound.ISongInfo;
    import com.sulake.habbo.sound.IHabboSound;

    public class SongDataEntry extends PlayListEntry implements ISongInfo
    {
        private var _soundObject:IHabboSound = null;
        private var _songData:String;
        private var _jukeboxDiskId:int = -1;

        public function SongDataEntry(k:int, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:IHabboSound)
        {
            this._soundObject = _arg_5;
            this._songData = "";
            super(k, _arg_2, _arg_3, _arg_4);
        }

        override public function get id():int
        {
            return _id;
        }

        override public function get length():int
        {
            return _length;
        }

        override public function get name():String
        {
            return _name;
        }

        override public function get creator():String
        {
            return _creator;
        }

        public function get loaded():Boolean
        {
            return (this._soundObject == null) ? false : this._soundObject.ready;
        }

        public function get soundObject():IHabboSound
        {
            return this._soundObject;
        }

        public function get songData():String
        {
            return this._songData;
        }

        public function get diskId():int
        {
            return this._jukeboxDiskId;
        }

        public function set soundObject(k:IHabboSound):void
        {
            this._soundObject = k;
        }

        public function set songData(k:String):void
        {
            this._songData = k;
        }

        public function set diskId(k:int):void
        {
            this._jukeboxDiskId = k;
        }
    }
}
