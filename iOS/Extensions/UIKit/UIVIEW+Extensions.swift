//
//  UIVIEW+Extensions.swift
//  deliveryApp
//
//  Created by Kareem on 11/23/20.
//  Copyright © 2020 Kareem. All rights reserved.
//

import Foundation
import UIKit

//MARK:- ViewActionHandler
typealias HandlerView = (() -> Void)
internal var handlerActions: [UIView: HandlerView] = [:]
extension UIView {
    internal static func emptyHanlder() {
        handlerActions = [:]
    }
    internal func emptyHanlder() {
        handlerActions = [:]
    }
    internal func UIViewAction(selector: @escaping HandlerView) {
        self.isUserInteractionEnabled = true
        actionHandleBlock(action: selector)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.triggerActionHandleBlock))
        self.addGestureRecognizer(tap)
    }
    
    internal func actionHandleBlock(action:(() -> Void)? = nil) {
        if action != nil {
            handlerActions[self] = action
        } else {
            guard let action = handlerActions[self] else { return }
            action()
        }
    }
    @objc func triggerActionHandleBlock() {
        self.actionHandleBlock()
    }
}
