﻿package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetLoadingBarUpdateEvent extends RoomWidgetUpdateEvent
    {
        public static const RWLBUE_SHOW_LOADING_BAR:String = "RWLBUE_SHOW_LOADING_BAR";
        public static const RWLBUW_HIDE_LOADING_BAR:String = "RWLBUW_HIDE_LOADING_BAR";

        public function RoomWidgetLoadingBarUpdateEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(k, _arg_2, _arg_3);
        }
    }
}
