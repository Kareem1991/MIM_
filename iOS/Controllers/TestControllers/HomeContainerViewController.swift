//
//  HomeContainerViewController.swift
//  MIM (iOS)
//
//  Created by Kareem on 9/15/21.
//

import UIKit
import FINNBottomSheet

class HomeContainerViewController: UIViewController {
    
    @IBOutlet weak var circledView: UIView!
    @IBOutlet weak var tabsViewHeight: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tabsView: UIView!
    var bottomSheetView : BottomSheetView? = nil
     
    private lazy var firstViewController: FirstViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var firstViewController = storyboard.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        self.add(asChildViewController: firstViewController)
        
        return firstViewController
    }()
    
    private lazy var secondViewController: SecondViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        // Instantiate View Controller
        var secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.add(asChildViewController: secondViewController)
        return secondViewController
    }()
    
    @IBAction func firstBtnClicked(_ sender: UIButton) {
        self.bottomSheetView?.transition(to: 0)
        remove(asChildViewController: secondViewController)
        add(asChildViewController: firstViewController)
//        bottomSheetView?.present(in: self.view, targetIndex: 0)
//        bottomSheetView?.layoutSubviews()
        

    
    }
    @IBAction func secondBtnClicked(_ sender: UIButton) {
        self.bottomSheetView?.transition(to: 0)
        remove(asChildViewController: firstViewController)
        add(asChildViewController: secondViewController)
    }
    

    func setupView() {
      
        add(asChildViewController: firstViewController)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        // Instantiate View Controller
        let addLocation = storyboard.instantiateViewController(withIdentifier: "addServiceLocationBottomViewController") as! addServiceLocationBottomViewController
        addLocation.modalPresentationStyle = .overFullScreen
        addLocation.modalTransitionStyle = .coverVertical
        addLocation.parentVC = self
        present(addLocation, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.circledView.layer.cornerRadius = 60

        add(asChildViewController: firstViewController)
         bottomSheetView = BottomSheetView(
            contentView: tabsView,
            contentHeights: [80 , 160]
        )
        // Can be presented in any UIView subclass
        bottomSheetView?.present(in: self.view, targetIndex: 0)
        self.circledView.UIViewAction {
            self.bottomSheetView?.transition(to: 1)
        }
       
       
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        // Instantiate View Controller
//        let addLocation = storyboard.instantiateViewController(withIdentifier: "addServiceLocationBottomViewController") as! addServiceLocationBottomViewController
//        addLocation.modalPresentationStyle = .overFullScreen
//        addLocation.modalTransitionStyle = .coverVertical
//        addLocation.parentVC = self
//        present(addLocation, animated: true, completion: nil)

    }
    
}

extension HomeContainerViewController
{
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)
        
        // Add Child View as Subview
        containerView.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParent()
    }
    
}


