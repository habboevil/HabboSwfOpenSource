﻿package com.sulake.habbo.communication.messages.incoming.catalog
{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class CatalogPageMessageOfferData 
    {
        private var _offerId:int;
        private var _localizationId:String;
        private var _rent:Boolean;
        private var _priceInCredits:int;
        private var _priceInActivityPoints:int;
        private var _activityPointType:int;
        private var _clubLevel:int;
        private var _giftable:Boolean;
        private var _bundlePurchaseAllowed:Boolean;
        private var _isPet:Boolean;
        private var _previewImage:String;
        private var _products:Vector.<CatalogPageMessageProductData>;

        public function CatalogPageMessageOfferData(k:IMessageDataWrapper)
        {
            this._offerId = k.readInteger();
            this._localizationId = k.readString();
            this._rent = k.readBoolean();
            this._priceInCredits = k.readInteger();
            this._priceInActivityPoints = k.readInteger();
            this._activityPointType = k.readInteger();
            this._giftable = k.readBoolean();
            var _local_2:int = k.readInteger();
            this._products = new Vector.<CatalogPageMessageProductData>(0);
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._products.push(new CatalogPageMessageProductData(k));
                _local_3++;
            }
            this._clubLevel = k.readInteger();
            this._bundlePurchaseAllowed = k.readBoolean();
            this._isPet = k.readBoolean();
            this._previewImage = k.readString();
        }

        public function get offerId():int
        {
            return this._offerId;
        }

        public function get localizationId():String
        {
            return this._localizationId;
        }

        public function get isRent():Boolean
        {
            return this._rent;
        }

        public function get priceInCredits():int
        {
            return this._priceInCredits;
        }

        public function get priceInActivityPoints():int
        {
            return this._priceInActivityPoints;
        }

        public function get products():Vector.<CatalogPageMessageProductData>
        {
            return this._products;
        }

        public function get activityPointType():int
        {
            return this._activityPointType;
        }

        public function get clubLevel():int
        {
            return this._clubLevel;
        }

        public function get giftable():Boolean
        {
            return this._giftable;
        }

        public function get bundlePurchaseAllowed():Boolean
        {
            return this._bundlePurchaseAllowed;
        }

        public function get previewImage():String
        {
            return this._previewImage;
        }
    }
}
