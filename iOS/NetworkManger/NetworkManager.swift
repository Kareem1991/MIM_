//
//  NetworkManager.swift
//
//  Created by Kareem on 8/23/19.
//  Copyright ©️ 2019 Nasil. All rights reserved.
//

import Foundation
import Alamofire
import CoreData

class NetworkManager {
    //MARK: - Create Request
    func createHTTPRequest(
        url: String,
        params: Dictionary<String, Any>,
        method: HTTPMethod,
        headers : HTTPHeaders  ,
    completionHandler: @escaping (_ httpResponse: DataResponse<Any> , _ code:Int) -> ()) {
    let manager = Alamofire.SessionManager.default
    manager.session.configuration.timeoutIntervalForRequest = 60
    manager.session.configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
    print(params)
    
    var headersMethod = headers
    headersMethod["Accept"] =  "application/json"
    headersMethod["Content-Type"] = "application/json"
    if case UserStatus.isLogged = true {
        headersMethod["Authorization"] = "Bearer \(UserStatus.token ?? "")"
    }
    //
    let request = manager.request(
        url,
        method: method,
        parameters: params,
        encoding: URLEncoding.httpBody,
        headers: headersMethod)

    request.responseJSON { response in
        print(response.debugDescription)
        let code  = response.response?.statusCode
        completionHandler(response , code ?? 0)
    }
}
    //MARK: - Create Raw Body Request
    func createHTTPBodyRequest(
        url: String,
        params: Dictionary<String, Any>,
        method: HTTPMethod,
        headers : HTTPHeaders  ,
        completionHandler: @escaping (_ httpResponse: DataResponse<Any> , _ code:Int) -> ()) {
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 60
        manager.session.configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        print(params)
        
        var request  = URLRequest(url: URL(string: url)!)
        do {
            let data = try JSONSerialization.data(withJSONObject: params, options: [])
            let paramString = String(data: data, encoding: String.Encoding.utf8)
            request.httpBody = paramString?.data(using: .utf8)
        } catch let error {
            print("Error : \(error.localizedDescription)")
        }
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        var headersMethod = headers
        if case UserStatus.isLogged = true {
            headersMethod["Authorization"] = "Bearer \(UserStatus.token ?? "")"
            print("TOKEN >>>>> \(headersMethod["Authorization"] ?? "")")
        }
        request.allHTTPHeaderFields = headersMethod
        manager.request(request).responseJSON { (response) in
            print(response.debugDescription)
            let code  = response.response?.statusCode
            completionHandler(response , code ?? 0)
        }
    }
    
    //MARK: - Upload Multi Images
//    func UploadMultipleImagesRequest(parameters: [String: Any], imagesData: [UIImage?] = [], imageParamName: String = "", completionHandler: @escaping (_ httpResponse: SellProductResponseData?, _ code:Int?) -> ()) {
//        
//        let url =  Constants.baseURL + "all/V1/mpapi/seller/create/product"
//        print("url is \(url)")
//        
//        let headers: HTTPHeaders = [
//         "Authorization": "Bearer \(UserStatus.token ?? "")",
//            "content-type": "application/json"
//        ]
//
//        Alamofire.upload(multipartFormData: { multipartFormData in
//            var listData:[UIImage] = [UIImage]()
//            for item in imagesData {
//                guard let image = item else {
//                    return
//                }
//                listData.append(image)
//            }
//            
//                print("list iMAGES IS \(listData)")
//            
//            var counter = 0
//            for item in listData {
//                multipartFormData.append(item.jpegData(compressionQuality: 0.5) ?? Data(), withName: "images[]", fileName: "\(String(describing: item)).png", mimeType: "image/png")
//                
//                counter += 1
//
//            }
//            
//            
//       
//            
//            print("multipartFormData\(multipartFormData)")
//            
//                   for (key, value) in parameters {
//                          multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key)
//                    }
//            
//                }, to: url,headers: headers ,
//
//                    encodingCompletion: { encodingResult in
//                        switch encodingResult {
//                        case .success(let upload, _, _):
//                            upload.responseJSON { response in
//                                print("response\(response)")
//                                
//                                guard
//                                    let data = response.data,
//                                    let model = Coder().decode(toType: SellProductResponseData.self, from: data)
//                                    else { print("error")
//                                        return completionHandler(nil, 0)
//                                    }
//                                
//                                completionHandler(model, 1)
//                                }
//                        case .failure(let error):
//                            print(error)
//                            completionHandler(nil, 0)
//                        }
//
//                })
//    }
}
