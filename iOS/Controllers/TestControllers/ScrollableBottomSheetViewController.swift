////
////  ScrollableBottomSheetViewController.swift
////  BottomSheet
////
////  Created by Ahmed Elassuty on 10/15/16.
////  Copyright © 2016 Ahmed Elassuty. All rights reserved.
////
//
//import UIKit
//class ScrollableBottomSheetViewController: UIViewController {
//    @IBOutlet weak var draggableView: UIView!
//    @IBOutlet weak var addItem: UIButton!
//    @IBOutlet weak var salaryItems: UILabel!
//    @IBOutlet weak var deletedBtn: UIButton!
//    let fullView: CGFloat = 100
//    var partialView: CGFloat {
//        return UIScreen.main.bounds.height - 200
//    }
//
//    
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(ScrollableBottomSheetViewController.panGesture))
//        gesture.delegate = self
//        view.addGestureRecognizer(gesture)
//        
//        // go to home
//        // continue shopping
//    }
//    
//    
// 
//  
//    
//    
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        prepareBackgroundView()
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        UIView.animate(withDuration: 0.6, animations: { [weak self] in
//            let frame = self?.view.frame
//            let yComponent = self?.partialView
//            self?.view.frame = CGRect(x: 0, y: yComponent!, width: frame!.width, height: frame!.height - 100)
//            })
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    @objc func panGesture(_ recognizer: UIPanGestureRecognizer) {
//        
//        let translation = recognizer.translation(in: self.view)
//        let velocity = recognizer.velocity(in: self.view)
//
//        let y = self.view.frame.minY
//        if (y + translation.y >= fullView) && (y + translation.y <= partialView) {
//            self.view.frame = CGRect(x: 0, y: y + translation.y, width: view.frame.width, height: view.frame.height)
//            recognizer.setTranslation(CGPoint.zero, in: self.view)
//        }
//        
//        if recognizer.state == .ended {
//            var duration =  velocity.y < 0 ? Double((y - fullView) / -velocity.y) : Double((partialView - y) / velocity.y )
//            
//            duration = duration > 1.3 ? 1 : duration
//            
//            UIView.animate(withDuration: duration, delay: 0.0, options: [.allowUserInteraction], animations: {
//                if  velocity.y >= 0 {
//                    self.view.frame = CGRect(x: 0, y: self.partialView, width: self.view.frame.width, height: self.view.frame.height)
//                } else {
//                    self.view.frame = CGRect(x: 0, y: self.fullView, width: self.view.frame.width, height: self.view.frame.height)
//                }
//                
//                }, completion: { [weak self] _ in
//                    if ( velocity.y < 0 ) {
//                    }
//            })
//        }
//    }
//    
//    
//    func prepareBackgroundView(){
//        let blurEffect = UIBlurEffect.init(style: .dark)
//        let visualEffect = UIVisualEffectView.init(effect: blurEffect)
//        let bluredView = UIVisualEffectView.init(effect: blurEffect)
//        bluredView.contentView.addSubview(visualEffect)
//        visualEffect.frame = UIScreen.main.bounds
//        bluredView.frame = UIScreen.main.bounds
//        view.insertSubview(bluredView, at: 0)
//    }
//
//}
//
//
//extension ScrollableBottomSheetViewController: UIGestureRecognizerDelegate {
//
//    // Solution
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        let gesture = (gestureRecognizer as! UIPanGestureRecognizer)
//        let direction = gesture.velocity(in: view).y
//
//        let y = view.frame.minY
//        if (y == fullView && draggableView.contentOffset.y == 0 && direction > 0) || (y == partialView) {
//            tableView.isScrollEnabled = false
//        } else {
//            draggableView.isScrollEnabled = true
//        }
//        
//        return false
//    }
//    
//}
// 
//extension ScrollableBottomSheetViewController {
//    func deleteProduct(productId:String , sellerId:String) {
//        self.startLoading()
//        MyListWebServiceFactory().deleteProduct(sellerId: sellerId , productId: productId , lang: UserStatus.lang ?? "en") { error , model , code in
//            self.stopLoading()
//            if code == 200 {
//                if model?.status == 1 {
//                    HelperMethods.showAlertWith(title: "", msg: model?.message ?? "" , type: .success , layout: .cardView)
//                    (UIApplication.shared.delegate as! AppDelegate).reset(selectedTabbarIndex: 0)
//                } else {
//                    HelperMethods.showAlertWith(title: "", msg: model?.message ?? "", type: .error , layout: .cardView)
//                }
//            } else {
//                HelperMethods.showAlertWith(title: "", msg: "Something went wrong".localized, type: .error , layout: .cardView)
//            }
//        }
//    }
//}
//
