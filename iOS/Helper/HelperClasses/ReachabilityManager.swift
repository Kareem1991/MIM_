////
////  ReachabilityManager.swift
////  Ajeer
////
////  Created by Kareem on 3/10/19.
////  Copyright © 2019 Kareem. All rights reserved.
////
//
import Foundation
import UIKit
import Reachability
import SVProgressHUD
// 1. Importing the Library
class ReachabilityManager: NSObject {
    static  let shared = ReachabilityManager()  // 2. Shared instance
    // 3. Boolean to track network reachability
    var isNetworkAvailable : Bool {
        return reachabilityStatus != .unavailable
    }
    // 4. Tracks current NetworkStatus (notReachable, reachableViaWiFi, reachableViaWWAN)
    var reachabilityStatus: Reachability.Connection = .unavailable
    // 5. Reachability instance for Network status monitoring
    let reachability = try! Reachability()
    
    ///
    /// — parameter notification: Notification with the Reachability instance
    @objc func reachabilityChanged(notification: Notification) {
        let reachability = notification.object as! Reachability
        reachabilityStatus = reachability.connection
        switch reachability.connection {
        
        case .wifi, .cellular:
            print("reachable Network")
            if  UserStatus.isNetworkFail == true {
                HelperMethods.showAlertWith(title: "", msg: "Online".localized , type: .success , layout: .statusLine)
                UserStatus.isNetworkFail = false
                SVProgressHUD.dismiss()
            }
//            goToMainScreen()
        RootWindowController.setRootSplashScreen()
        case .unavailable:
            print("unreachable Network")
            HelperMethods.showAlertWith(title: "Unreachable Network".localized, msg: "Please,check your internet connection".localized , type: .error , layout: .statusLine)
            RootWindowController.setRootWindowForNetworkError()
            UserStatus.isNetworkFail = true
            SVProgressHUD.dismiss()
        case .none:
            print("none")
            break
            
        }
    }
    
    func startMonitoring() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.reachabilityChanged),
                                               name: Notification.Name.reachabilityChanged,
                                               object: reachability)
        do{
            try reachability.startNotifier()
        } catch {
            print("Could not start reachability notifier")
        }
    }
    
    
    func goToMainScreen() {
//        initLang()
//        SVProgressHUD.dismiss()
//        if case UserStatus.isEnterIntro = true {
//            if case UserStatus.isLogged = true {
//                (UIApplication.shared.delegate as! AppDelegate).reset(selectedTabbarIndex: 0)
//            } else {
//                RootWindowController.setRootWindowForLogin()
//            }
//        } else {
//            RootWindowController.setRootInto()
//        }
    }
//
}
