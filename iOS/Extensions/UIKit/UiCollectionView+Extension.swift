//
//  UiCollectionView+Extension.swift
//  deliveryApp
//
//  Created by Kareem on 11/26/20.
//  Copyright © 2020 Kareem. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func scrollToNextItem() {
        let contentOffset = CGFloat(floor(self.contentOffset.x + self.bounds.size.width))
        self.moveToFrame(contentOffset: contentOffset)
    }
    func moveToFrame(contentOffset : CGFloat) {
        self.setContentOffset(CGPoint(x: contentOffset, y: self.contentOffset.y), animated: true)
    }
}
