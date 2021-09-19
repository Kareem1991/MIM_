//
//  OnBoardModel.swift
//  PinkMerce
//
//  Created by Kareem on 1/11/21.
//  Copyright © 2021 Kareem. All rights reserved.
//

import Foundation
 
struct onBoardModel: Codable {

    var status : Int?
    var data : [BannersData]?
    var message: String?
}
// MARK: - Datum
struct BannersData: Codable {
    var title, subTitle: String?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case title
        case subTitle = "sub_title"
        case url
    }
}
