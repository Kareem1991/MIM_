//
//  addServiceLocationBottomViewController.swift
//  Ajeer
//
//  Created by Kareem on 9/23/20.
//  Copyright © 2020 Ajeer. All rights reserved.
//


import UIKit



class addServiceLocationBottomViewController: UIViewController {
    
    @IBOutlet weak var addAnotherLabelTextField: UITextField!
    @IBOutlet weak var anotherAddressLabel: UILabel!
    @IBOutlet weak var addWorkAddressTextField: UITextField!
    @IBOutlet weak var workTitleLabel: UILabel!
    @IBOutlet weak var addHomeTextField: UITextField!
    @IBOutlet weak var homeTitle: UILabel!
    @IBOutlet weak var servicesAddressLabelTitle: UILabel!
    @IBOutlet weak var currentLocationTitle: UILabel!
    @IBOutlet weak var currentLocationLabel: UILabel!

    var parentVC = HomeContainerViewController()
    let swipeThreshold: CGFloat = 160
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var parentViewHeight: NSLayoutConstraint!
    var viewTranslation = CGPoint(x: 0, y: 0)
    @IBOutlet weak var blankSpace: UIView!
    var gesture = UITapGestureRecognizer()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        setupContentViewHeight()
        setupGestureRecognizers()
    }
    

    
    func setupContentViewHeight(){
        //Reduce parent view height and enable scrolling if it's more than the main view height
        if parentView.frame.size.height > view.frame.size.height{
            parentViewHeight.constant = view.frame.size.height - 60
            //            contentScrollView.isScrollEnabled = true
        }
    }
    
 
    
    func setupGestureRecognizers(){
        //Content view gesture
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handleDismiss(recognizer:)))
        panGestureRecognizer.cancelsTouchesInView = false
        parentView.addGestureRecognizer(panGestureRecognizer)
        
        //Blank space gesture
        gesture = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        blankSpace.addGestureRecognizer(gesture)
    }
    
    // MARK: - Objc Methods
    @objc func didTapView(_ sender: UITapGestureRecognizer){
        self.dismiss(animated: true, completion: {
        })
    }
    
    
    
    @objc func handleDismiss (recognizer: UIPanGestureRecognizer) {
        //Handle screen dismissing
        switch recognizer.state {
        case .changed:
            viewTranslation = recognizer.translation(in: view)
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                guard self.viewTranslation.y > 0 else {return}
                self.view.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
            })
        case .ended:
            if viewTranslation.y < swipeThreshold {
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                    self.view.transform = .identity
                })
            } else {
//                self.dismiss(animated: true, completion: {
//                })
//                blankSpace.removeGestureRecognizer(gesture)
            }
        default:
            break
        }
    }
    
   
    
}


