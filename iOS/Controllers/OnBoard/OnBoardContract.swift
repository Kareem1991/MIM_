//
//  OnBoardContract.swift
//  PinkMerce
//
//  Created by Kareem on 1/11/21.
//  Copyright © 2021 Kareem. All rights reserved.
//

import Foundation

protocol OnBoardPresenterContract: class {
    func getOnBoardPages(lang:String)
}

protocol OnBoardViewContract: class {
    func didFetch(model: onBoardModel?)
    func didFail()
}
