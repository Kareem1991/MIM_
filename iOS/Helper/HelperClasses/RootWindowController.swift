//
//  RootWindowController.swift


import UIKit

class RootWindowController: NSObject {
    class func setRootWindowForHome(isCommingFromNotification:Bool? = false)
    {
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "GoToOrders") , object: nil)
//        let homeTab = Initializer.createViewControllerWithId(storyBoardName:  Storyboards.HomeTabBar.rawValue, storyBoardId: "TabbarModel")  as!  TabbarModel
//        let window = Initializer.createWindow()
//        window.rootViewController = homeTab
//        window.makeKeyAndVisible()
    }
    
    class func setRootWindowForLogin()
    {
        let homeTab = Initializer.createViewControllerWithId(storyBoardName: Storyboards.Authentication.rawValue , storyBoardId: navigationIds.SignInNav.rawValue)
        let window = Initializer.createWindow()
        window.rootViewController = homeTab
        window.makeKeyAndVisible()
    }
    
    class func setRootWindowForNetworkError()
    {
        let homeTab = Initializer.createViewControllerWithId(storyBoardName: Storyboards.Home.rawValue , storyBoardId: navigationIds.networkError.rawValue)
        let window = Initializer.createWindow()
        window.rootViewController = homeTab
        window.makeKeyAndVisible()
    }
    
    class func setRootWindowForOrders(isCommingFromNotification:Bool? = false)
    {
        let homeTab = Initializer.createViewControllerWithId(storyBoardName: Storyboards.Orders.rawValue , storyBoardId: "myOrdersContainerNav") as! UINavigationController
        let window = Initializer.createWindow()
        window.rootViewController = homeTab
        window.makeKeyAndVisible()
    }

    
    
    class func setRootWindowValidation(index:Int)
    {
//        let homeTab = Initializer.createViewControllerWithId(storyBoardName: Storyboards.placeHolder.rawValue , storyBoardId: navigationIds.PlaceholderNav.rawValue)
//         UserDefaults.standard.removeObject(forKey: "index")
//         UserDefaults.standard.setValue(index, forKey: "index")
//        let window = Initializer.createWindow()
//        window.rootViewController = homeTab
//        window.makeKeyAndVisible()
    }
    
    class func setRootInto()
    {
        let homeTab = Initializer.createViewControllerWithId(storyBoardName: Storyboards.OnBoard.rawValue , storyBoardId: "OnBoardViewController")
        let window = Initializer.createWindow()
        window.rootViewController = homeTab
        window.makeKeyAndVisible()
    }

    class func setRootSplashScreen()
    {
        let homeTab = Initializer.createViewControllerWithId(storyBoardName: Storyboards.OnBoard.rawValue , storyBoardId: "SplashScreenViewController")
        let window = Initializer.createWindow()
        window.rootViewController = homeTab
        window.makeKeyAndVisible()
    }

}
