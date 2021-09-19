//
//  Initializer.swift
//  Supplements
//
//  Created by Abonabih on 11/13/17.
//  Copyright © 2017 Kareem. All rights reserved.
//

import Foundation
import UIKit

class Initializer {
    
    class func getStoryBoard(storyBoard:String)-> UIStoryboard {
        let storyBoard = UIStoryboard(name: storyBoard, bundle: nil)
        return storyBoard
    }
    
    class func createViewControllerWithId(storyBoardName:String , storyBoardId:String)->UIViewController{
        let storboard = getStoryBoard(storyBoard: storyBoardName)
        let vc = storboard.instantiateViewController(withIdentifier: storyBoardId)
        return vc
    }
    
    class func createWindow()->UIWindow{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let window = appDelegate.window
        return window!
    }
    
}
