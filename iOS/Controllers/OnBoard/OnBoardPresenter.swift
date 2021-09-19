//
//  OnBoardPresenter.swift
//  PinkMerce
//
//  Created by Kareem on 1/11/21.
//  Copyright © 2021 Kareem. All rights reserved.
//

import Foundation

class OnBoardPresenter {
    weak var view: OnBoardViewContract?
}

extension OnBoardPresenter: OnBoardPresenterContract {
    func getOnBoardPages(lang: String) {
//        OnBoardingWebServiceFactory().getOnBoardScreens(lang: lang) { (error , model , code) in
//            if code == 200 {
//                if let response = model {
//                 self.view?.didFetch(model: response)
//                }
//            } else {
//                self.view?.didFail()
//            }
//        }
    }
}

