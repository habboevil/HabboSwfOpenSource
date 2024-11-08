﻿package com.sulake.habbo.groups
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.users.HabboGroupDetailsData;
    import com.sulake.habbo.communication.messages.outgoing.users.GetHabboGroupDetailsMessageComposer;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets.IBadgeImageWidget;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.outgoing.users.GetGuildEditInfoMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.JoinHabboGroupMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;

    public class GroupRoomInfoCtrl implements IDisposable 
    {
        private static const ROOM_GROUP_INFO:String = "room_group_info";

        private var _manager:HabboGroupsManager;
        private var _window:IWindowContainer;
        private var _expanded:Boolean = true;
        private var _group:HabboGroupDetailsData;
        private var _expectedGroupId:int;

        public function GroupRoomInfoCtrl(k:HabboGroupsManager)
        {
            this._manager = k;
        }

        public function dispose():void
        {
            if (this._Str_8061())
            {
                this._manager.toolbar.extensionView.detachExtension(ROOM_GROUP_INFO);
            }
            this._manager = null;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._manager == null;
        }

        public function onRoomInfo(k:GuestRoomData):void
        {
            if (!this._manager.groupRoomInfoEnabled)
            {
                return;
            }
            if (k.habboGroupId > 0)
            {
                this._expectedGroupId = k.habboGroupId;
                this._manager.send(new GetHabboGroupDetailsMessageComposer(k.habboGroupId, false));
            }
            else
            {
                this._expectedGroupId = 0;
                this.close();
            }
        }

        public function onGroupDeactivated(k:int):void
        {
            if (((k == this._group.groupId) || (k == this._expectedGroupId)))
            {
                this._Str_21514 = 0;
                this.close();
            }
        }

        public function onGroupDetails(k:HabboGroupDetailsData):void
        {
            if (!this._manager.groupRoomInfoEnabled)
            {
                return;
            }
            if (k.groupId == this._expectedGroupId)
            {
                this._expanded = true;
                this._group = k;
                this.refresh();
            }
        }

        public function _Str_18808(k:int):Boolean
        {
            return ((!(this._window == null)) && (!(this._group == null))) && (k == this._group.groupId);
        }

        private function refresh():void
        {
            if (!this._group._Str_6444)
            {
                return;
            }
            this.prepareWindow();
            this._window.findChildByName("bg_expanded").visible = this._expanded;
            this._window.findChildByName("bg_contracted").visible = (!(this._expanded));
            this._window.findChildByName("group_name_txt").visible = this._expanded;
            this._window.findChildByName("join_button").visible = ((this._expanded) && (this._group._Str_19430));
            this._window.findChildByName("join_button").enable();
            this._window.findChildByName("request_membership_button").visible = ((this._expanded) && (this._group._Str_21531));
            this._window.findChildByName("manage_button").visible = ((this._expanded) && (this._group.isOwner));
            this._window.findChildByName("group_logo").visible = this._expanded;
            this._window.findChildByName("group_name_txt").caption = this._group.groupName;
            this._window.findChildByName("info_region").visible = this._expanded;
            var k:IBadgeImageWidget = (IWidgetWindow(this._window.findChildByName("group_logo")).widget as IBadgeImageWidget);
            k.badgeId = this._group.badgeCode;
            k.groupId = this._group.groupId;
            this._window.x = 0;
            this._window.y = 0;
            this._window.height = ((this._expanded) ? this._window.findChildByName("bg_expanded").height : this._window.findChildByName("bg_contracted").height);
            if (this._Str_8061())
            {
                this._manager.toolbar.extensionView.attachExtension(ROOM_GROUP_INFO, this._window, -1, ["next_quest_timer", "quest_tracker", "event_info_window"]);
            }
        }

        private function prepareWindow():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IWindowContainer(this._manager.getXmlWindow("group_room_info"));
            this._window.findChildByName("join_button").procedure = this.onJoin;
            this._window.findChildByName("request_membership_button").procedure = this.onJoin;
            this._window.findChildByName("manage_button").procedure = this.onManage;
            this._window.findChildByName("title_region").procedure = this._Str_23702;
            this._window.findChildByName("info_region").procedure = this._Str_24561;
        }

        public function close():void
        {
            if (this._window != null)
            {
                if (this._Str_8061())
                {
                    this._manager.toolbar.extensionView.detachExtension(ROOM_GROUP_INFO);
                }
                this._expectedGroupId = 0;
                this._group = null;
            }
        }

        private function _Str_23702(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._expanded = (!(this._expanded));
            this.refresh();
            this._manager.toolbar.events.dispatchEvent(new HabboToolbarEvent(HabboToolbarEvent.HTE_GROUP_ROOM_INFO_CLICK));
        }

        private function _Str_24561(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._manager.trackGoogle("groupRoomInfo", "groupInfo");
                this._manager.send(new GetHabboGroupDetailsMessageComposer(this._group.groupId, true));
                this._manager.toolbar.events.dispatchEvent(new HabboToolbarEvent(HabboToolbarEvent.HTE_GROUP_ROOM_INFO_CLICK));
            }
        }

        private function onManage(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._manager.trackGoogle("groupRoomInfo", "manageGroup");
                this._manager.send(new GetGuildEditInfoMessageComposer(this._group.groupId));
                this._manager.toolbar.events.dispatchEvent(new HabboToolbarEvent(HabboToolbarEvent.HTE_GROUP_ROOM_INFO_CLICK));
            }
        }

        private function onJoin(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._manager.trackGoogle("groupRoomInfo", "joinGroup");
                this._window.findChildByName("join_button").disable();
                this._manager.send(new JoinHabboGroupMessageComposer(this._group.groupId));
                this._manager.send(new EventLogMessageComposer(HabboGroupsManager.HABBOGROUPS, ("" + this._group.groupId), "join"));
                this._manager.toolbar.events.dispatchEvent(new HabboToolbarEvent(HabboToolbarEvent.HTE_GROUP_ROOM_INFO_CLICK));
            }
        }

        public function set _Str_21514(k:int):void
        {
            this._expectedGroupId = k;
        }

        private function _Str_8061():Boolean
        {
            return (((!(this._manager == null)) && (!(this._manager.toolbar == null))) && (!(this._manager.toolbar.extensionView == null))) && (this._manager.toolbarAttachEnabled);
        }
    }
}
