//
//  HomeWebServiceFactory.swift
//  PinkMerce
//
//  Created by Kareem on 2/14/21.
//  Copyright © 2021 Kareem. All rights reserved.
//

import Foundation
import SVProgressHUD

class HomeWebServiceFactory {
//    //MARK:- HomeExplore
//    func HomeExplore(lang:String  , completionHandler: @escaping (
//                        _ error: ErrorModel?,
//                        _ jsonData: HomeExploreModel? ,
//                        _ statusCode:Int) -> ()) {
//       
//        var url = ""
//        if UserStatus.id == nil {
//            url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(lang)/V1/api/homePage?customer_id=0")
//        } else {
//            url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(lang)/V1/api/homePage?customer_id=\((UserStatus.id ?? ""))")
//        }
//        NetworkManager().createHTTPRequest(
//            url: url  ,
//            params: [:] ,
//            method: .get, headers: [:]) { (response , code)  in
//            let statusCode = response.response?.statusCode
//            if statusCode == 200 {
//                let data = try? JSONDecoder().decode(HomeExploreModel.self, from: response.data ?? Data())
//                completionHandler(nil , data , response.response?.statusCode ?? 0)
//            } else {
//                if statusCode == 500 {
//                    SVProgressHUD.dismiss()
//                    HelperMethods.showAlertWith(title: "", msg: "Internal Server Error".localized , type: .error , layout: .cardView)
//                }
//
//            }
//        }
//    }
//    
//    //MARK:- Feeds
//    func GetFeeds(lang:String , customerId:String , completionHandler: @escaping (
//                    _ error: ErrorModel?,
//                    _ jsonData: FeedsModel? ,
//                    _ statusCode:Int) -> ()) {
//        var url = ""
//        if UserStatus.id == nil {
//            url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(lang)/V1/api/feeds")
//        } else {
//            url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(lang)/V1/api/feeds?customer_id=\((UserStatus.id ?? ""))")
//        }
//        NetworkManager().createHTTPBodyRequest(
//            url: url  ,
//            params: ["customer_id":customerId] ,
//            method: .post , headers: [:]) { (response , code)  in
//            let statusCode = response.response?.statusCode
//            if statusCode == 200 {
//                let data = try? JSONDecoder().decode(FeedsModel.self, from: response.data ?? Data())
//                completionHandler(nil , data , response.response?.statusCode ?? 0)
//            } else {
//                if statusCode == 500 {
//                    SVProgressHUD.dismiss()
//                    HelperMethods.showAlertWith(title: "", msg: "Internal Server Error".localized , type: .error , layout: .cardView)
//                }
//
//            }
//        }
//    }
//    
//    //MARK:- MyList
//    func GetMyList(customerId:String , size:String , brand:String , cat:String , limit : String, completionHandler: @escaping (
//                    _ error: ErrorModel?,
//                    _ jsonData: MyListModel? ,
//                    _ statusCode:Int) -> ()) {
//        let url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(UserStatus.lang ?? "en")/V1/mobiconnect/catalog/customerlist/" + "\(customerId)")
//        NetworkManager().createHTTPBodyRequest(
//            url: url  ,
//            params: ["size": size  , "brand": brand , "category": cat , "limit": limit] ,
//            method: .post , headers: [:]) { (response , code)  in
//            let statusCode = response.response?.statusCode
//            if statusCode == 200 {
//                
//                let data = try? JSONDecoder().decode(MyListModel.self, from: response.data ?? Data())
//                completionHandler(nil , data , response.response?.statusCode ?? 0)
//            } else {
//                if statusCode == 500 {
//                    SVProgressHUD.dismiss()
//                    HelperMethods.showAlertWith(title: "", msg: "Internal Server Error".localized , type: .error , layout: .cardView)
//                }
//
//            }
//        }
//    }
//    
//   
//    
//    //MARK:- ViewAll
//    func ViewAllInterests(customerId:String , catId:String , viewAllType:ViewAllUrl , completionHandler: @escaping (
//                            _ error: ErrorModel?,
//                            _ jsonData: ViewAllModel? ,
//                            _ statusCode:Int) -> ()) {
//        var url = ""
//        switch viewAllType {
//        case .viewAllRecentAdded:
//            url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(UserStatus.lang ?? "en")/V1/api/recentlyadde?category_id=\(catId)&customer_id=\(customerId)")
//            break
//        case .viewAllLikes:
//            url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(UserStatus.lang ?? "en")/V1/mobiconnect/wishlist/getwishlist?customer_id=\(customerId)")
//            break
//        case .viewAllDoubleTake:
//            url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(UserStatus.lang ?? "en")/V1/api/doubletake?customer_id=\(customerId)")
//            break
//        case .viewAllInterests:
//            url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(UserStatus.lang ?? "en")/V1/mobiconnect/catalog/customerlistall?customer_id=\(customerId)")
//        case .viewAllProductsByCat:
//            url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(UserStatus.lang ?? "en")/V1/mobiconnect/catalog/getCategoryProducts/?searchCriteria[filter_groups][0][filters][0][field]=category_id&searchCriteria[filter_groups][0][filters][0][value]=\(catId)&searchCriteria[filter_groups][0][filters][0][condition_type]=eq&searchCriteria[pageSize]=20&searchCriteria[currentPage]=1&searchCriteria[sortOrders][0][field]=position&searchCriteria[sortOrders][0][direction]=DESC&customer_id=\(UserStatus.id ?? "")")
//        }
//       
//        NetworkManager().createHTTPRequest(
//            url: url  ,
//            params: [:] ,
//            method: .get , headers: [:]) { (response , code)  in
//            let statusCode = response.response?.statusCode
//            if statusCode == 200 {
//                let data = try? JSONDecoder().decode(ViewAllModel.self, from: response.data ?? Data())
//                completionHandler(nil , data , response.response?.statusCode ?? 0)
//            } else {
//                if statusCode == 500 {
//                    SVProgressHUD.dismiss()
//                    HelperMethods.showAlertWith(title: "", msg: "Internal Server Error".localized , type: .error , layout: .cardView)
//                }
//
//            }
//        }
//    }
//    //MARK:- ViewAllBestSeller
//    func ViewAllBestSeller(customerId:String , completionHandler: @escaping (
//                            _ error: ErrorModel?,
//                            _ jsonData: ViewAllBestSellerModel? ,
//                            _ statusCode:Int) -> ()) {
//        var url = ""
//        if UserStatus.id == nil {
//            url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(UserStatus.lang ?? "en")/V1/api/bestsellers?customer_id=0")
//        } else {
//            url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(UserStatus.lang ?? "en")/V1/api/bestsellers?customer_id=\(customerId)")
//        }
//     
//        NetworkManager().createHTTPRequest(
//            url: url  ,
//            params: [:] ,
//            method: .get , headers: [:]) { (response , code)  in
//            let statusCode = response.response?.statusCode
//            if statusCode == 200 {
//                let data = try? JSONDecoder().decode(ViewAllBestSellerModel.self, from: response.data ?? Data())
//                completionHandler(nil , data , response.response?.statusCode ?? 0)
//            } else {
//                if statusCode == 500 {
//                    SVProgressHUD.dismiss()
//                    HelperMethods.showAlertWith(title: "", msg: "Internal Server Error".localized , type: .error , layout: .cardView)
//                }
//
//            }
//        }
//    }
//    //MARK:- Follow
//    func Follow(customerId:String , sellerId:String , lang:String , completionHandler: @escaping (
//                    _ error: ErrorModel?,
//                    _ jsonData: FollowModel? ,
//                    _ statusCode:Int) -> ()) {
//        let url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(lang)/V1/api/follow")
//        NetworkManager().createHTTPBodyRequest(
//            url: url  ,
//            params: ["seller_id":sellerId , "customer_id" : customerId] ,
//            method: .post , headers: [:]) { (response , code)  in
//            let statusCode = response.response?.statusCode
//            if statusCode == 200 {
//                let data = try? JSONDecoder().decode(FollowModel.self, from: response.data ?? Data())
//                completionHandler(nil , data , response.response?.statusCode ?? 0)
//            } else {
//                if statusCode == 500 {
//                    SVProgressHUD.dismiss()
//                    HelperMethods.showAlertWith(title: "", msg: "Internal Server Error".localized , type: .error , layout: .cardView)
//                }
//
//            }
//        }
//    }
//    //MARK:- UnFollow
//    func UnFollow(customerId:String , lang:String , sellerId:String , completionHandler: @escaping (
//                    _ error: ErrorModel?,
//                    _ jsonData: FollowModel? ,
//                    _ statusCode:Int) -> ()) {
//        let url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(lang)/V1/api/unfollow")
//        NetworkManager().createHTTPBodyRequest(
//            url: url  ,
//            params: ["customer_id" : customerId , "seller_id": sellerId] ,
//            method: .post , headers: [:]) { (response , code)  in
//            let statusCode = response.response?.statusCode
//            if statusCode == 200 {
//                let data = try? JSONDecoder().decode(FollowModel.self, from: response.data ?? Data())
//                completionHandler(nil , data , response.response?.statusCode ?? 0)
//            } else {
//                if statusCode == 500 {
//                    SVProgressHUD.dismiss()
//                    HelperMethods.showAlertWith(title: "", msg: "Internal Server Error".localized , type: .error , layout: .cardView)
//                }
//
//            }
//        }
//    }
//    
//    //MARK:- LikeAndUnlike
//    func likeAndUnlike (customerId:String , lang:String , likeUrl:LikeUrl , productKey:String  ,productId:String , completionHandler: @escaping (
//                            _ error: ErrorModel?,
//                            _ jsonData: FollowModel? ,
//                            _ statusCode:Int) -> ()) {
//        var url = ""
//        switch likeUrl {
//        case .like:
//            url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(lang)/V1/mobiconnect/wishlist/add")
//            break
//        case .unlike:
//            url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(lang)/V1/mobiconnect/wishlist/remove")
//            break
//        }
//        NetworkManager().createHTTPBodyRequest(
//            url: url  ,
//            params: ["customer_id" : customerId , productKey : productId] ,
//            method: .post , headers: [:]) { (response , code)  in
//            let statusCode = response.response?.statusCode
//            if statusCode == 200 {
//                print("reso is \(response)")
//                let data = try? JSONDecoder().decode(FollowModel.self, from: response.data ?? Data())
//                completionHandler(nil , data , response.response?.statusCode ?? 0)
//            } else {
//                if statusCode == 500 {
//                    SVProgressHUD.dismiss()
//                    HelperMethods.showAlertWith(title: "", msg: "Internal Server Error".localized , type: .error , layout: .cardView)
//                }
//
//            }
//        }
//    }
//    
//    //MARK:- AddAndRemoveCart
//    func addOrRemoveFromCart(customerId:String , lang:String , cartUrl:CartUrl ,productId:String , completionHandler: @escaping (
//                                _ error: ErrorModel?,
//                                _ jsonData: FollowModel? ,
//                                _ statusCode:Int) -> ()) {
//        var url = ""
//        var params = [String:Any]()
//        switch cartUrl {
//        case .add:
//            url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(lang)/V1/mobiconnect/checkout/add")
//            params = ["customer_id" : customerId , "product_id" : productId , "qty" : "1" ]
//            break
//        case .remove:
//            url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(lang)/V1/mobiconnect/checkout/delete")
//            params = ["customer_id" : customerId , "item_id" : productId]
//            break
//        }
//        NetworkManager().createHTTPBodyRequest(
//            url: url  ,
//            params: params ,
//            method: .post , headers: [:]) { (response , code)  in
//            let statusCode = response.response?.statusCode
//            if statusCode == 200 {
//                let data = try? JSONDecoder().decode(FollowModel.self, from: response.data ?? Data())
//                completionHandler(nil , data , response.response?.statusCode ?? 0)
//            } else {
//                if statusCode == 500 {
//                    SVProgressHUD.dismiss()
//                    HelperMethods.showAlertWith(title: "", msg: "Internal Server Error".localized , type: .error , layout: .cardView)
//                }
//
//            }
//        }
//    }
}
