//com.sulake.habbo.catalog.IHabboCatalog

package com.sulake.habbo.catalog{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.window.IHabboWindowManager;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.navigator.IHabboNavigator;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import flash.display.BitmapData;
    import com.sulake.habbo.catalog.purse.IPurse;
    import com.sulake.habbo.catalog.recycler.IRecycler;
    import com.sulake.habbo.catalog.marketplace.IMarketPlace;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.catalog.navigation.ICatalogNavigator;

    public /*dynamic*/ interface IHabboCatalog extends IUnknown {

        function redeemVoucher(k:String):void;
        function loadCatalogPage(k:int, _arg_2:int, _arg_3:String):void;
        function getRecyclerStatus():void;
        function getRecyclerPrizes():void;
        function sendRecycleItems(k:Array):void;
        function get assets():IAssetLibrary;
        function get windowManager():IHabboWindowManager;
        function get events():IEventDispatcher;
        function get localization():IHabboLocalizationManager;
        function get connection():IConnection;
        function get navigator():IHabboNavigator;
        function get videoOffers():IVideoOfferManager;
        function toggleCatalog(k:String, _arg_2:Boolean=false, _arg_3:Boolean=true):void;
        function openCatalog():void;
        function openCatalogPage(k:String, _arg_2:String=null):void;
        function openRoomAdCatalogPageInExtendedMode(k:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:Date):void;
        function openCatalogPageById(k:int, _arg_2:int, _arg_3:String):void;
        function openCatalogPageByOfferId(k:int, _arg_2:String):void;
        function openInventoryCategory(k:String):void;
        function openCreditsHabblet():void;
        function setupInventoryForRecycler(k:Boolean):void;
        function requestInventoryFurniToRecycler():int;
        function returnInventoryFurniFromRecycler(k:int):Boolean;
        function get privateRoomSessionActive():Boolean;
        function get tradingActive():Boolean;
        function getProductData(k:String):IProductData;
        function getFurnitureData(k:int, _arg_2:String):IFurnitureData;
        function getPixelEffectIcon(k:int):BitmapData;
        function getSubscriptionProductIcon(k:int):BitmapData;
        function getPurse():IPurse;
        function getRecycler():IRecycler;
        function getMarketPlace():IMarketPlace;
        function getPublicMarketPlaceOffers(k:int, _arg_2:int, _arg_3:String, _arg_4:int):void;
        function getOwnMarketPlaceOffers():void;
        function buyMarketPlaceOffer(k:int):void;
        function redeemSoldMarketPlaceOffers():void;
        function redeemExpiredMarketPlaceOffer(k:int):void;
        function getMarketplaceItemStats(k:int, _arg_2:int):void;
        function showNotEnoughCreditsAlert():void;
        function getHabboClubOffers(k:int):void;
        function openClubBuy(k:int, _arg_2:String):void;
        function set giftReceiver(k:String):void;
        function buySnowWarTokensOffer():void;
        function get imageGalleryHost():String;
        function showVipBenefits():void;
        function displayProductIcon(k:String, _arg_2:int, _arg_3:IBitmapWrapperWindow):void;
        function openRentConfirmationWindow(k:IFurnitureData, _arg_2:Boolean, _arg_3:int=-1, _arg_4:int=-1, _arg_5:Boolean=false):void;
        function get buildersClubEnabled():Boolean;
        function toggleBuilderCatalog():void;
        function get catalogType():String;
        function getCatalogNavigator(k:String):ICatalogNavigator;
        function get isDoorModeOverriddenInCurrentRoom():Boolean;

    }
}//package com.sulake.habbo.catalog

