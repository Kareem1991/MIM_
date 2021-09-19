//
//  FirstViewController.swift
//  MIM (iOS)
//
//  Created by Kareem on 9/15/21.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var animatedView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        // I added seperate colour to UIView when animation move from one animation block to another.So, You can get better understanding how the sequence of animation works.
//        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseInOut , animations: {
//            //Frame Option 1:
//            self.animatedView.frame = CGRect(x: self.animatedView.frame.origin.x , y: 20, width: self.animatedView.frame.width, height: self.animatedView.frame.height)
//            //Frame Option 2:
//            },completion: nil)
        self.animatedView.slideInFromBottom()

    }
}



extension UIView {
    func slideInFromTop(duration: TimeInterval = 1.5, completionDelegate: AnyObject? = nil) {
        // Create a CATransition animation
        let slideInFromTopTransition = CATransition()
        
        // Customize the animation's properties
        slideInFromTopTransition.type = CATransitionType.push
        slideInFromTopTransition.subtype = CATransitionSubtype.fromBottom
        slideInFromTopTransition.duration = duration
        slideInFromTopTransition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        slideInFromTopTransition.fillMode = CAMediaTimingFillMode.removed
        
        // Add the animation to the View's layer
        self.layer.add(slideInFromTopTransition, forKey: "slideInFromTopTransition")
    }

    func slideInFromBottom(duration: TimeInterval = 1   , completionDelegate: AnyObject? = nil) {
        // Create a CATransition animation
        let slideInFromBottomTransition = CATransition()
        
        // Customize the animation's properties
        slideInFromBottomTransition.type = CATransitionType.push
        slideInFromBottomTransition.subtype = CATransitionSubtype.fromTop
        slideInFromBottomTransition.duration = duration
        slideInFromBottomTransition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        slideInFromBottomTransition.fillMode = CAMediaTimingFillMode.removed
        
        // Add the animation to the View's layer
        self.layer.add(slideInFromBottomTransition, forKey: "slideInFromBottomTransition")
    }
}
