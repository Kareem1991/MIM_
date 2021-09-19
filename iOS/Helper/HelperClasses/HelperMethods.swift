//
//  HelperMethods.swift
//  Estrahti
//
//  Created by Kareem on 8/30/20.
//  Copyright © 2020 Kareem. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import SwiftMessages


class HelperMethods  {
  
    class  func customizeAttributedStr(str:String , color : UIColor , isUnderLineWanted:Bool? = true) -> NSMutableAttributedString
    {
        if case isUnderLineWanted = true {
            let attrs = [
                NSAttributedString.Key.font : UIFont(name: "Cairo-Regular", size: 17.0)!,
                NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue ,
                NSAttributedString.Key.foregroundColor : color
                ] as [NSAttributedString.Key : Any]
            let attrString = NSMutableAttributedString(string: str.localized , attributes:attrs)
            return attrString

        } else {
            let attrs = [
                NSAttributedString.Key.font : UIFont(name: "Cairo-Regular", size: 17.0)!,
                NSAttributedString.Key.foregroundColor : UIColor.lightGray
                ] as [NSAttributedString.Key : Any]
            let attrString = NSMutableAttributedString(string: str.localized , attributes:attrs)
            return attrString
        }
    }

    class func safeUrl(url: String) -> String {
        let safeURL = url.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        return safeURL
    }
    class func reverseNavColor(nav:UINavigationController) {
        nav.navigationBar.setBackgroundImage(nil, for: .default)
        nav.navigationBar.shadowImage = nil
        nav.navigationBar.barTintColor = #colorLiteral(red: 0.2274509804, green: 0.5490196078, blue: 0.631372549, alpha: 1)
        nav.navigationBar.isTranslucent = false
        nav.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }

    class func valideTextLength(textName:String ,str:String , view:UIViewController , msg:String) {
        if   str.count > 10  && str.count <= 2 {
            view.showAlertWith(title: "" , msg: textName + " " + "not less than 2 characters and not more than 10 characters.".localized , type: .warning , layout: .cardView)
            return
        }
    }
    // MARK: - Check For Empty Strings
    class func isNotEmptyString(text: String, withAlertMessage message: String) -> Bool{
        if text == ""{
            showAlertWith(msg: message)
            return false
        }
        else{
            return true
        }
    }

    static func showAlertWith(title: String? = nil, msg: String? = nil, type: Theme = .warning, layout: MessageView.Layout = .cardView) {
        // Instantiate a message view from the provided card view layout. SwiftMessages searches for nib
        // files in the main bundle first, so you can easily copy them into your project and make changes.
        let view = MessageView.viewFromNib(layout: layout)
        
        // Theme message elements with the warning style.
        
        view.configureTheme(type)
        view.button?.isHidden = true
        
        if type == .warning {
            view.configureTheme(backgroundColor: .red, foregroundColor: .white)
        }
        
        view.configureContent(title: title ?? "", body: msg ?? "", iconText: "")
        
        // Show the message.
        SwiftMessages.show(view: view)
    }
  class func setupImage(url:String , image:UIImageView) {
        let imageUrl = URL(string: url)
        image.kf.setImage(with: imageUrl)
        image.kf.setImage(
            with: imageUrl ,
            placeholder: #imageLiteral(resourceName: "Group 712") ,
            options: [])
    }
    
}

