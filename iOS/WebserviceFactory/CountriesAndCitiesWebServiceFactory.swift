////
////  CountriesAndCitiesWebServiceFactory.swift
////  PinkMerce
////
////  Created by Kareem on 2/7/21.
////  Copyright © 2021 Kareem. All rights reserved.
////
//
//import Foundation
//
//class CountriesAndCitiesWebServiceFactory {
//    //MARK:- GetCountries
//    func getCountries(lang:String , completionHandler: @escaping (
//                        _ error: ErrorModel?,
//                        _ jsonData: CountriesModel? ,
//                        _ statusCode:Int) -> ()) {
//        let url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(lang)/V1/directory/countries/SA")
//        NetworkManager().createHTTPRequest(
//            url: url  ,
//            params: [:] ,
//            method: .get, headers: [:]) { (response , code)  in
//            let statusCode = response.response?.statusCode
//            if statusCode == 200 {
//                let data = try? JSONDecoder().decode(CountriesModel.self, from: response.data ?? Data())
//                completionHandler(nil , data , response.response?.statusCode ?? 0)
//            } else {
//                if statusCode == 500 {
//                    HelperMethods.showAlertWith(title: "", msg: "Internal Server Error".localized , type: .error , layout: .cardView)
//                }
//
//            }
//        }
//    }
//    //MARK:- GetCities
//    func getCitiesByCountryId(countryId:String , completionHandler: @escaping (
//                                _ error: ErrorModel?,
//                                _ jsonData: CitiesModel? ,
//                                _ statusCode:Int) -> ()) {
//        let url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(UserStatus.lang ?? "en")/V1/rcp/getcity/\(countryId)")
//        NetworkManager().createHTTPRequest(
//            url: url  ,
//            params: [:] ,
//            method: .get, headers: [:]) { (response , code)  in
//            let statusCode = response.response?.statusCode
//            if statusCode == 200 {
//                let data = try? JSONDecoder().decode(CitiesModel.self, from: response.data ?? Data())
//                completionHandler(nil , data , response.response?.statusCode ?? 0)
//            } else {
//                if statusCode == 500 {
//                    HelperMethods.showAlertWith(title: "", msg: "Internal Server Error".localized , type: .error , layout: .cardView)
//                }
//
//            }
//        }
//    }
//    
//
//    
//    //MARK:- Add Address
//    func AddAddress(params:[String:Any] , completionHandler: @escaping (
//                        _ error: ErrorModel?,
//                        _ jsonData: MapsAddressDetailsModel? ,
//                        _ statusCode:Int) -> ()) {
//        let url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(UserStatus.lang ?? "en")/V1/mobiconnect/customer/saveaddress")
//        NetworkManager().createHTTPBodyRequest(
//            url: url  ,
//            params: params ,
//            method: .post, headers: [:]) { (response , code)  in
//            let statusCode = response.response?.statusCode
//            if statusCode == 200 {
//                let data = try? JSONDecoder().decode(MapsAddressDetailsModel.self, from: response.data ?? Data())
//                completionHandler(nil , data , response.response?.statusCode ?? 0)
//            } else {
//                if statusCode == 500 {
//                    HelperMethods.showAlertWith(title: "", msg: "Internal Server Error".localized , type: .error , layout: .cardView)
//                }
//
//            }
//        }
//    }
//    
//    
//    //MARK:- Add Address
//    func UpdateAddress(params:[String:Any] , completionHandler: @escaping (
//                        _ error: ErrorModel?,
//                        _ jsonData: MapsAddressDetailsModel? ,
//                        _ statusCode:Int) -> ()) {
//        let url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "all/V1/mobiconnect/customer/updateaddress")
//        NetworkManager().createHTTPBodyRequest(
//            url: url  ,
//            params: params ,
//            method: .post, headers: [:]) { (response , code)  in
//            let statusCode = response.response?.statusCode
//            if statusCode == 200 {
//                let data = try? JSONDecoder().decode(MapsAddressDetailsModel.self, from: response.data ?? Data())
//                completionHandler(nil , data , response.response?.statusCode ?? 0)
//            } else {
//                if statusCode == 500 {
//                    HelperMethods.showAlertWith(title: "", msg: "Internal Server Error".localized , type: .error , layout: .cardView)
//                }
//
//            }
//        }
//    }
//}
