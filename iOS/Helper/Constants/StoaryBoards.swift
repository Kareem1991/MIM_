//
//  StoaryBoards.swift
//  Estrahti
//
//  Created by Kareem on 8/30/20.
//  Copyright © 2020 Kareem. All rights reserved.
//

import Foundation

public var isCommingFromSettings = false
public enum Storyboards: String {
    case Authentication = "Authentication"
    case Maps = "Maps"
    case OnBoard = "OnBoard"
    case HomeTabBar = "TabBarSTB"
    case AddDish = "AddDish"
    case Static = "StaticSTB"
    case ProductDetails = "ProductDetails"
    case Seller = "Seller"
    case WishListAndCart = "WishListAndCart"
    case MyLists = "MyLists"
    case Home = "Home"
    case Menu = "MenuSTB"
    case ShopGuide = "ShopGuideSTB"
    case CheckOut = "CheckOutStoryboard"
    case Orders = "MyOrders"
    case Settings = "SettingSTB"
    case tapPayment = "TapPayments"
    case placeHolder = "PlaceHolderSTB"
    
}

public enum navigationIds: String {
    case SignInNav = "SignInNav"
    case PlaceholderNav = "placeholderNav"
    case networkError = "InternetConnectionErrorViewController"
}

