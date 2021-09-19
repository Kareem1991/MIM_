//
//  OnBoardViewController.swift
//  deliveryApp
//
//  Created by Kareem on 11/23/20.
//  Copyright © 2020 Kareem. All rights reserved.
//

import UIKit


class OnBoardViewController: UIViewController {
    //MARK: - @IBOutlet
    @IBOutlet weak var onBoardCollectionView: UICollectionView! {
        didSet {
            onBoardCollectionView.dataSource = self
            onBoardCollectionView.delegate = self
        }
    }
    //MARK: - Variables
//    let sc = SCPageControlView()
    var onBoardPresenter: OnBoardPresenter?
    var banners : [BannersData]? = []

    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UserStatus.isEnterIntro = true
        self.onBoardPresenter = .init()
        self.onBoardPresenter?.view = self
        self.onBoardPresenter?.getOnBoardPages(lang:UserStatus.lang ?? "en")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.onBoardPresenter = nil
    }

    //MARK: - Methods
    func setUp(dotsCount:Int) {
//        sc.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height-150, width: UIScreen.main.bounds.size.width , height: 50)
//        sc.scp_style = .SCJAFillCircle
//        sc.set_view( self.banners?.count ?? 0 , current: 0 , current_color: .AppPink , disable_color: .lightGray)
//        view.addSubview(sc)
    }
    
    //MARK: ScrollView Delegate
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        sc.scroll_did(scrollView)
//    }
}

//MARK:- UICollection DataSource
extension OnBoardViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.banners?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardCollectionViewCell" , for: indexPath)
//        cell.onBoardTitle.text = self.banners?[indexPath.row].title ?? ""
//        cell.onBoardDescription.text = self.banners?[indexPath.row].subTitle ?? ""
//        cell.onBoardImage.loadImage(url: self.banners?[indexPath.row].url ?? "")
//        cell.skipBtn.UIViewAction {
//            RootWindowController.setRootWindowForLogin()
//        }
//        cell.nextBtn.UIViewAction {
//            if indexPath.row == (self.banners?.count ?? 0) - 1 {
//                RootWindowController.setRootWindowForLogin()
//            }
//            collectionView.scrollToNextItem()
//        }
        return cell
    }
}

//MARK:- UICollection Delegate Flow layout
extension OnBoardViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: collectionView.bounds.width , height: collectionView.bounds.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0 ,left: 0, bottom: 0, right: 0)
    }
}

extension OnBoardViewController : OnBoardViewContract {
  
    func didFetch(model: onBoardModel?) {
        self.banners = model?.data
        self.setUp(dotsCount: self.banners?.count ?? 0)
        self.onBoardCollectionView.reloadData()
    }
    
    func didFail() {
        //MARK:- Handle Error
        self.showAlert(title: "Error", message: "Something went wrong")
    }
}
