﻿package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.HabboNavigatorBootstrap;
    import com.sulake.iid.IIDHabboNavigator;
    import binaryData.*;
    import images.*;

    public class HabboNavigatorCom extends SimpleApplication 
    {
        public static var manifest:Class = HabboNavigatorCom_manifest;
        public static var arrow_down_white_png:Class = HabboNavigatorCom_arrow_down_white_png;
        public static var arrow_right_white_png:Class = HabboNavigatorCom_arrow_right_white_png;
        public static var create_room_png:Class = HabboNavigatorCom_create_room_png;
        public static var doormode_doorbell_png:Class = HabboNavigatorCom_doormode_doorbell_png;
        public static var doormode_doorbell_small_png:Class = HabboNavigatorCom_doormode_doorbell_small_png;
        public static var doormode_password_png:Class = HabboNavigatorCom_doormode_password_png;
        public static var doormode_password_small_png:Class = HabboNavigatorCom_doormode_password_small_png;
        public static var doormode_invisible_png:Class = HabboNavigatorCom_doormode_invisible_png;
        public static var doormode_invisible_small_png:Class = HabboNavigatorCom_doormode_invisible_small_png;
        public static var enter_room_png:Class = HabboNavigatorCom_enter_room_png;
        public static var enter_room_l_png:Class = HabboNavigatorCom_enter_room_l_png;
        public static var enter_room_m_png:Class = HabboNavigatorCom_enter_room_m_png;
        public static var enter_room_r_png:Class = HabboNavigatorCom_enter_room_r_png;
        public static var enter_room_a_png:Class = HabboNavigatorCom_enter_room_a_png;
        public static var favourite_png:Class = HabboNavigatorCom_favourite_png;
        public static var facebook_logo_small_png:Class = HabboNavigatorCom_facebook_logo_small_png;
        public static var group_base_icon_png:Class = HabboNavigatorCom_group_base_icon_png;
        public static var make_favourite_png:Class = HabboNavigatorCom_make_favourite_png;
        public static var home_png:Class = HabboNavigatorCom_home_png;
        public static var make_home_png:Class = HabboNavigatorCom_make_home_png;
        public static var icon_weblink_png:Class = HabboNavigatorCom_icon_weblink_png;
        public static var icon_hotelview_png:Class = HabboNavigatorCom_icon_hotelview_png;
        public static var icon_hotelview_reactive_png:Class = HabboNavigatorCom_icon_hotelview_reactive_png;
        public static var navi_room_favourite_png:Class = HabboNavigatorCom_navi_room_favourite_png;
        public static var navi_room_friends_png:Class = HabboNavigatorCom_navi_room_friends_png;
        public static var navi_room_icon_png:Class = HabboNavigatorCom_navi_room_icon_png;
        public static var navi_room_official_png:Class = HabboNavigatorCom_navi_room_official_png;
        public static var navi_room_own_png:Class = HabboNavigatorCom_navi_room_own_png;
        public static var navi_room_popular_png:Class = HabboNavigatorCom_navi_room_popular_png;
        public static var navi_tag_hot_1_png:Class = HabboNavigatorCom_navi_tag_hot_1_png;
        public static var navi_tag_hot_2_png:Class = HabboNavigatorCom_navi_tag_hot_2_png;
        public static var navi_tag_hot_3_png:Class = HabboNavigatorCom_navi_tag_hot_3_png;
        public static var popup_arrow_down_png:Class = HabboNavigatorCom_popup_arrow_down_png;
        public static var popup_arrow_left_png:Class = HabboNavigatorCom_popup_arrow_left_png;
        public static var popup_arrow_right_png:Class = HabboNavigatorCom_popup_arrow_right_png;
        public static var trading_allowed_png:Class = HabboNavigatorCom_trading_allowed_png;
        public static var rico_rnd_m_png:Class = HabboNavigatorCom_rico_rnd_m_png;
        public static var rico_rnd_l_png:Class = HabboNavigatorCom_rico_rnd_l_png;
        public static var rico_rnd_l_b_png:Class = HabboNavigatorCom_rico_rnd_l_b_png;
        public static var rico_rnd_r_png:Class = HabboNavigatorCom_rico_rnd_r_png;
        public static var rico_rnd_r_b_png:Class = HabboNavigatorCom_rico_rnd_r_b_png;
        public static var select_arrow_png:Class = HabboNavigatorCom_select_arrow_png;
        public static var tag_l_png:Class = HabboNavigatorCom_tag_l_png;
        public static var tag_m_png:Class = HabboNavigatorCom_tag_m_png;
        public static var tag_r_png:Class = HabboNavigatorCom_tag_r_png;
        public static var tag_l_reactive_png:Class = HabboNavigatorCom_tag_l_reactive_png;
        public static var tag_m_reactive_png:Class = HabboNavigatorCom_tag_m_reactive_png;
        public static var tag_r_reactive_png:Class = HabboNavigatorCom_tag_r_reactive_png;
        public static var thumb_up_png:Class = HabboNavigatorCom_thumb_up_png;
        public static var tile_icon_black_png:Class = HabboNavigatorCom_tile_icon_black_png;
        public static var tile_icon_white_png:Class = HabboNavigatorCom_tile_icon_white_png;
        public static var usercount_fixed_b_png:Class = HabboNavigatorCom_usercount_fixed_b_png;
        public static var usercount_fixed_g_png:Class = HabboNavigatorCom_usercount_fixed_g_png;
        public static var usercount_fixed_o_png:Class = HabboNavigatorCom_usercount_fixed_o_png;
        public static var usercount_fixed_r_png:Class = HabboNavigatorCom_usercount_fixed_r_png;
        public static var usercount_fixed_y_png:Class = HabboNavigatorCom_usercount_fixed_y_png;
        public static var remove_rights_png:Class = HabboNavigatorCom_remove_rights_png;
        public static var grs_front_page_search_big_xml:Class = HabboNavigatorCom_grs_front_page_search_big_xml;
        public static var grs_front_page_search_small_xml:Class = HabboNavigatorCom_grs_front_page_search_small_xml;
        public static var grs_guest_room_details_short_xml:Class = HabboNavigatorCom_grs_guest_room_details_short_xml;
        public static var grs_guest_room_details_phase_one_xml:Class = HabboNavigatorCom_grs_guest_room_details_phase_one_xml;
        public static var grs_guest_room_details_long_xml:Class = HabboNavigatorCom_grs_guest_room_details_long_xml;
        public static var grs_guest_room_thumbnail_xml:Class = HabboNavigatorCom_grs_guest_room_thumbnail_xml;
        public static var grs_room_ads_details_short_xml:Class = HabboNavigatorCom_grs_room_ads_details_short_xml;
        public static var grs_room_ads_details_phase_one_xml:Class = HabboNavigatorCom_grs_room_ads_details_phase_one_xml;
        public static var grs_hot_room_details_xml:Class = HabboNavigatorCom_grs_hot_room_details_xml;
        public static var grs_main_window_xml:Class = HabboNavigatorCom_grs_main_window_xml;
        public static var grs_main_window_new_xml:Class = HabboNavigatorCom_grs_main_window_new_xml;
        public static var grs_official_room_row_xml:Class = HabboNavigatorCom_grs_official_room_row_xml;
        public static var grs_official_room_row_phase_one_xml:Class = HabboNavigatorCom_grs_official_room_row_phase_one_xml;
        public static var grs_popular_tag_row_xml:Class = HabboNavigatorCom_grs_popular_tag_row_xml;
        public static var grs_promoted_room_category_xml:Class = HabboNavigatorCom_grs_promoted_room_category_xml;
        public static var grs_category_selector_xml:Class = HabboNavigatorCom_grs_category_selector_xml;
        public static var grs_usercount_xml:Class = HabboNavigatorCom_grs_usercount_xml;
        public static var nav_error_popup_xml:Class = HabboNavigatorCom_nav_error_popup_xml;
        public static var nav_simple_alert_xml:Class = HabboNavigatorCom_nav_simple_alert_xml;
        public static var nav_promo_alert_xml:Class = HabboNavigatorCom_nav_promo_alert_xml;
        public static var iro_event_settings_xml:Class = HabboNavigatorCom_iro_event_settings_xml;
        public static var iro_event_info_xml:Class = HabboNavigatorCom_iro_event_info_xml;
        public static var iro_room_details_framed_xml:Class = HabboNavigatorCom_iro_room_details_framed_xml;
        public static var iro_room_filter_framed_xml:Class = HabboNavigatorCom_iro_room_filter_framed_xml;
        public static var iro_tag_xml:Class = HabboNavigatorCom_iro_tag_xml;
        public static var roc_create_room_xml:Class = HabboNavigatorCom_roc_create_room_xml;
        public static var roc_vip_promo_xml:Class = HabboNavigatorCom_roc_vip_promo_xml;
        public static var roc_room_thumbnail_xml:Class = HabboNavigatorCom_roc_room_thumbnail_xml;
        public static var ros_flat_controller_xml:Class = HabboNavigatorCom_ros_flat_controller_xml;
        public static var ros_banned_user_xml:Class = HabboNavigatorCom_ros_banned_user_xml;
        public static var ros_friend_xml:Class = HabboNavigatorCom_ros_friend_xml;
        public static var ros_badword_xml:Class = HabboNavigatorCom_ros_badword_xml;
        public static var ros_room_settings_xml:Class = HabboNavigatorCom_ros_room_settings_xml;
        public static var ros_confirm_xml:Class = HabboNavigatorCom_ros_confirm_xml;
        public static var password_input_xml:Class = HabboNavigatorCom_password_input_xml;
        public static var doorbell_xml:Class = HabboNavigatorCom_doorbell_xml;
        public static var guild_info_xml:Class = HabboNavigatorCom_guild_info_xml;
        public static var toolbar_hover_xml:Class = HabboNavigatorCom_toolbar_hover_xml;
        public static var enforce_category_xml:Class = HabboNavigatorCom_enforce_category_xml;
        public static var requiredClasses:Array = new Array(HabboNavigatorBootstrap, IIDHabboNavigator);
    }
}