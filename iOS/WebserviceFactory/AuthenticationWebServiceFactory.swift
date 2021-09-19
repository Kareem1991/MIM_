////
////  AuthenticationWebServiceFactory.swift
////  deliveryApp
////
////  Created by Kareem on 11/23/20.
////  Copyright © 2020 Kareem. All rights reserved.
////
//
//import Foundation
//import Alamofire
//import SVProgressHUD
//
//class AuthenticationWebServiceFactory {
//    //MARK:- SignIn
//    func SignIn(phone:String , password:String , completionHandler: @escaping (
//        _ error: ErrorModel?,
//        _ jsonData: SignInModel? ,
//        _ statusCode:Int) -> ()) {
//        let url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(UserStatus.lang ?? "en")/V1/mobiconnect/customer/login")
//        NetworkManager().createHTTPBodyRequest(
//            url: url  ,
//            params: ["phone_number": phone , "password":password , "firebase_token": UserStatus.firebaseToken ?? "" , "type" : "1"] ,
//            method: .post, headers: [:]) { (response , code)  in
//                let statusCode = response.response?.statusCode
//                if statusCode == 200 {
//                    let data = try? JSONDecoder().decode(SignInModel.self, from: response.data ?? Data())
//                    completionHandler(nil , data , response.response?.statusCode ?? 0)
//                } else {
//                    print("Error")
//                    if statusCode == 500 {
//                        SVProgressHUD.dismiss()
//                        HelperMethods.showAlertWith(title: "", msg: "Internal Server Error".localized , type: .error , layout: .cardView)
//                    }
//
//                }
//        }
//    }
//    //MARK:- SignUp
//    func SignUp(userName: String , email: String, password: String , referralCode:String , phone:String , completionHandler: @escaping (
//        _ error: ErrorModel?,
//        _ jsonData: SignUpModel? ,
//        _ statusCode:Int) -> ()) {
//        let url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(UserStatus.lang ?? "en")/V1/mobiconnect/customer/register")
//        NetworkManager().createHTTPBodyRequest(
//            url: url  ,
//            params: ["username": userName , "email":email , "password" : password , "phone_number":phone , "ref_code":referralCode , "firebase_token": UserStatus.firebaseToken ?? "" , "type" : "1"] ,
//            method: .post, headers: [:]) { (response , code)  in
//                let statusCode = response.response?.statusCode
//                if statusCode == 200 {
//                    let data = try? JSONDecoder().decode(SignUpModel.self, from: response.data ?? Data())
//                    completionHandler(nil , data , response.response?.statusCode ?? 0)
//                } else {
//                    print("Error")
//                    if statusCode == 500 {
//                        SVProgressHUD.dismiss()
//                        HelperMethods.showAlertWith(title: "", msg: "Internal Server Error".localized , type: .error , layout: .cardView)
//                    }
//
//            }
//        }
//    }
//    
//    //MARK:- Check OTP
//    func checkOtP(params:[String:Any] , urlType: otpUrl , completionHandler: @escaping (
//                    _ error: ErrorModel?,
//                    _ jsonData: OTPModel? ,
//                    _ statusCode:Int) -> ()) {
//        var url = ""
//        switch urlType {
//        case .forgetPassword:
//            url  = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(UserStatus.lang ?? "en")/V1/mobiconnect/customer/forgotpasswordwithotp")
//        case .signUp:
//            url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(UserStatus.lang ?? "en")/V1/mobiconnect/customer/confirm_code")
//        case .changeMobile:
//            url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(UserStatus.lang ?? "en")/V1/mobiconnect/customer/changenumber")
//        case .changeMail:
//            url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(UserStatus.lang ?? "en")/V1/mobiconnect/customer/changeemail")
//        default:
//            print("Default")
//        }
//
//        NetworkManager().createHTTPBodyRequest(
//            url: url  ,
//            params: params ,
//            method: .post, headers: [:]) { (response , code)  in
//            let statusCode = response.response?.statusCode
//            if statusCode == 200 {
//                let data = try? JSONDecoder().decode(OTPModel.self, from: response.data ?? Data())
//                completionHandler(nil , data , response.response?.statusCode ?? 0)
//            } else {
//                print("Error")
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
//    //MARK:- Forget Password
//    func resetPasswordLastStep( confirmCode:String , phone: String , newPassword:String , confirmPassword:String , completionHandler: @escaping (
//        _ error: ErrorModel?,
//        _ jsonData: ChangePasswordModel? ,
//        _ statusCode:Int) -> ()) {
//        let url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(UserStatus.lang ?? "en")/V1/mobiconnect/customer/forgotpasswordwithcode")
//        NetworkManager().createHTTPBodyRequest(
//            url: url  ,
//            params: ["confirm_code":confirmCode , "phone_number":phone , "new_password":newPassword , "confirm_password":confirmPassword] ,
//            method: .post, headers: [:]) { (response , code)  in
//                let statusCode = response.response?.statusCode
//                if statusCode == 200 {
//                    let data = try? JSONDecoder().decode(ChangePasswordModel.self, from: response.data ?? Data())
//                    completionHandler(nil , data , response.response?.statusCode ?? 0)
//                } else {
//                    print("Error")
//                    if statusCode == 500 {
//                        SVProgressHUD.dismiss()
//                        HelperMethods.showAlertWith(title: "", msg: "Internal Server Error".localized , type: .error , layout: .cardView)
//                    }
//
//                }
//         }
//    }
//    
// 
//    //MARK:-change Mail
//    func changeMailStep( id:String , mail: String , phone:String , completionHandler: @escaping (
//        _ error: ErrorModel?,
//        _ jsonData: ChangeMailModel? ,
//        _ statusCode:Int) -> ()) {
//        let urlRequest =  Constants.baseURL + "\(UserStatus.lang ?? "en" )/V1/mobiconnect/customer/changeemail"
//        let url = HelperMethods.safeUrl(url: urlRequest)
//        NetworkManager().createHTTPBodyRequest(
//            url: url  ,
//            params: ["customer_id":id , "email":mail , "password":phone],
//            method: .post, headers: [:]) { (response , code)  in
//                let statusCode = response.response?.statusCode
//                if statusCode == 200 {
//                    let data = try? JSONDecoder().decode(ChangeMailModel.self, from: response.data ?? Data())
//                    completionHandler(nil , data , response.response?.statusCode ?? 0)
//                } else {
//                    print("Error")
//                    if statusCode == 500 {
//                        SVProgressHUD.dismiss()
//                        HelperMethods.showAlertWith(title: "", msg: "Internal Server Error".localized , type: .error , layout: .cardView)
//                    }
//
//                }
//         }
//    }
//    
//    //MARK:-change Password
//    func changePasswordFunc( id:String , oldPass: String , newPass:String,confirmPass:String , completionHandler: @escaping (
//        _ error: ErrorModel?,
//        _ jsonData: ChangePasswordModel? ,
//        _ statusCode:Int) -> ()) {
//        let urlRequest =  Constants.baseURL + "\(UserStatus.lang ?? "en")/V1/mobiconnect/customer/resetpassword"
//        let url = HelperMethods.safeUrl(url: urlRequest)
//        NetworkManager().createHTTPBodyRequest(
//            url: url  ,
//            params: ["customer_id":id , "old_password":oldPass , "new_password":newPass,"confirm_password":confirmPass],
//            method: .post, headers: [:]) { (response , code)  in
//                let statusCode = response.response?.statusCode
//                if statusCode == 200 {
//                    let data = try? JSONDecoder().decode(ChangePasswordModel.self, from: response.data ?? Data())
//                    completionHandler(nil , data , response.response?.statusCode ?? 0)
//                } else {
//                    print("Error")
//                    if statusCode == 500 {
//                        SVProgressHUD.dismiss()
//                        HelperMethods.showAlertWith(title: "", msg: "Internal Server Error".localized , type: .error , layout: .cardView)
//                    }
//
//                }
//         }
//    }
//
//    
//    //MARK:-change Mobile
//    func changeMobileNumFunc( id:String , phoneNum: String , Pass:String, completionHandler: @escaping (
//        _ error: ErrorModel?,
//        _ jsonData: ChangeMobileModel? ,
//        _ statusCode:Int) -> ()) {
//        let urlRequest =  Constants.baseURL + "\(UserStatus.lang ?? "en")/V1/mobiconnect/customer/changenumber"
//        let url = HelperMethods.safeUrl(url: urlRequest)
//        NetworkManager().createHTTPBodyRequest(
//            url: url  ,
//            params: ["customer_id":id , "phone_number":phoneNum , "password":Pass],
//            method: .post, headers: [:]) { (response , code)  in
//                let statusCode = response.response?.statusCode
//                if statusCode == 200 {
//                    let data = try? JSONDecoder().decode(ChangeMobileModel.self, from: response.data ?? Data())
//                    completionHandler(nil , data , response.response?.statusCode ?? 0)
//                } else {
//                    print("Error")
//                    if statusCode == 500 {
//                        SVProgressHUD.dismiss()
//                        HelperMethods.showAlertWith(title: "", msg: "Internal Server Error".localized , type: .error , layout: .cardView)
//                    }
//
//                }
//         }
//    }
//    
//    //MARK:- Reset Password
//    
//    func resetPasswordStepOne( phone:String , completionHandler: @escaping (
//        _ error: ErrorModel?,
//        _ jsonData: ResetPasswordModel? ,
//        _ statusCode:Int) -> ()) {
//        let url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(UserStatus.lang ?? "en")/V1/mobiconnect/customer/forgotpasswordwithotp")
//        NetworkManager().createHTTPBodyRequest(
//            url: url  ,
//            params: ["phone_number":phone] ,
//            method: .post, headers: [:]) { (response , code)  in
//                let statusCode = response.response?.statusCode
//                if statusCode == 200 {
//                    let data = try? JSONDecoder().decode(ResetPasswordModel.self, from: response.data ?? Data())
//                    completionHandler(nil , data , response.response?.statusCode ?? 0)
//                } else {
//                    print("Error")
//                    if statusCode == 500 {
//                        SVProgressHUD.dismiss()
//                        HelperMethods.showAlertWith(title: "", msg: "Internal Server Error".localized , type: .error , layout: .cardView)
//                    }
//
//                }
//        }
//    }
//    
//    //MARK:- Resend Code
//    func resendCode(key:String , value:String , completionHandler: @escaping (
//        _ error: ErrorModel?,
//        _ jsonData: OTPModel? ,
//        _ statusCode:Int) -> ()) {
//        let url = HelperMethods.safeUrl(url: API.baseURL.rawValue + "\(UserStatus.lang ?? "en")/V1/mobiconnect/customer/reset_confirm_code")
//        NetworkManager().createHTTPBodyRequest(
//            url: url  ,
//            params: [key:value] ,
//            method: .post, headers: [:]) { (response , code)  in
//                let statusCode = response.response?.statusCode
//                if statusCode == 200 {
//                    let data = try? JSONDecoder().decode(OTPModel.self, from: response.data ?? Data())
//                    completionHandler(nil , data , response.response?.statusCode ?? 0)
//                } else {
//                    print("Error")
//                    if statusCode == 500 {
//                        SVProgressHUD.dismiss()
//                        HelperMethods.showAlertWith(title: "", msg: "Internal Server Error".localized , type: .error , layout: .cardView)
//                    }
//
//                }
//        }
//    }    
//}
