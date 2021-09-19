//
//  UserStatus.swift
//  AlNawares
//
//  Created by Kareem on 3/11/20.
//  Copyright © 2020 Kareem. All rights reserved.
//


import Foundation
struct UserStatus {
    
    static var isEnterIntro:Bool? {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.isEnterIntro)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.bool(forKey: Constants.isEnterIntro)
        }
    }
    
    static var isNetworkFail:Bool? {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.isNetworkFail)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.bool(forKey: Constants.isNetworkFail)
        }
    }
    static var isCommingFromNotification:Bool? {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.isCommingFromNotification)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.bool(forKey: Constants.isCommingFromNotification)
        }
    }
    
    static var deviceToken:String? {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.deviceToken)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey: Constants.deviceToken)
        }
    }
    
    static var cartCount:String? {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.cartCount)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey: Constants.cartCount)
        }
    }
    static var orderId:String? {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.orderId)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey: Constants.orderId)
        }
    }

    static var lang:String? {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.appLanguage)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey: Constants.appLanguage) ?? "en"
        }
    }

    static var isLogged:Bool? {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.isLogged)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.bool(forKey: Constants.isLogged)
        }
    }
    static var email:String? {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.email)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey:  Constants.email)
        }
    }
    static var token:String? {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.token)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey:  Constants.token)
        }
    }
    static var id:String? {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.id)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey:  Constants.id)
        }
    }
    
    
    static var name:String? {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.name)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey:  Constants.name)
        }
    }
    
    static var nickName:String? {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.name)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey:  Constants.name)
        }
    }
    
    
    static var referralCode:String? {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.referralCode)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey:  Constants.referralCode)
        }
    }
    
    
    static var lastName:String? {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.lastName)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey:  Constants.lastName)
        }
    }
    static var mobile:String? {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.mobile)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey:  Constants.mobile)
        }
    }
    static var image:String? {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.image)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey:  Constants.image)
        }
    }
    
    static var firebaseToken:String? {
           set{
               UserDefaults.standard.set(newValue, forKey: Constants.firebaseToken)
               UserDefaults.standard.synchronize()
           }
           get{
               return UserDefaults.standard.string(forKey:  Constants.firebaseToken)
           }
       }
    
    static var currencyIndex:Int? {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.currencyIndex)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.integer(forKey: Constants.currencyIndex)
        }
    }
    
    static var currencyId:String? {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.currency)
            UserDefaults.standard.synchronize()
         }
        get{
            return UserDefaults.standard.string(forKey:  Constants.currency)
        }
    }
    static var currencyName:String? {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.currencyName)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey:  Constants.currencyName)
        }
    }
    static var currencyImage:String? {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.currencyImage)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey:  Constants.currencyImage)
        }
    }
}
