//
//  UIColorExtensions.swift
//  homeCheif
//
//  Created by Mohamed Abdu on 4/17/18.
//  Copyright © 2018 Atiaf. All rights reserved.
//

import UIKit

extension UIColor {
    static func colorRGB(red: Int, green: Int, blue: Int, alpha: Float = 1) -> UIColor {
        return UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: CGFloat(alpha))
    }
}

//MARK: - uiview
extension UIView {

    func applyShadow(cornerRadius:CGFloat? = 30) {
    self.layer.cornerRadius = cornerRadius ?? 30
    self.layer.shadowRadius = 5
    self.layer.shadowOffset = .init(width: 1 , height: 1)
    self.layer.shadowColor = UIColor.lightGray.cgColor
    self.layer.shadowOpacity = 0.4
//    self.layer.shadowOpacity = 0.8
    self.layer.masksToBounds = false
    self.layer.shouldRasterize = true
    self.layer.rasterizationScale = UIScreen.main.scale
    }
}


extension UIImageView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

//MARK: - Rounded CornerUIButton
extension UIButton{
    func roundedButton(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
            byRoundingCorners: [.topRight , .bottomRight],
            cornerRadii: CGSize(width: 20, height: 20))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}

//MARK: - Rounded Corner UIVIEW @IBDesignable
@IBDesignable
class RoundedCornerView: UIView {

    var cornerRadiusValue : CGFloat = 0
    var corners : UIRectCorner = []


    @IBInspectable public var topLeft : Bool {
        get {
            return corners.contains(.topLeft)
        }
        set {
            setCorner(newValue: newValue, for: .topLeft)
        }
    }

    @IBInspectable public var topRight : Bool {
        get {
            return corners.contains(.topRight)
        }
        set {
            setCorner(newValue: newValue, for: .topRight)
        }
    }

    @IBInspectable public var bottomLeft : Bool {
        get {
            return corners.contains(.bottomLeft)
        }
        set {
            setCorner(newValue: newValue, for: .bottomLeft)
        }
    }

    @IBInspectable public var bottomRight : Bool {
        get {
            return corners.contains(.bottomRight)
        }
        set {
            setCorner(newValue: newValue, for: .bottomRight)
        }
    }

    func setCorner(newValue: Bool, for corner: UIRectCorner) {
        if newValue {
            addRectCorner(corner: corner)
        } else {
            removeRectCorner(corner: corner)
        }
    }

    func addRectCorner(corner: UIRectCorner) {
        corners.insert(corner)
        updateCorners()
    }

    func removeRectCorner(corner: UIRectCorner) {
        if corners.contains(corner) {
            corners.remove(corner)
            updateCorners()
        }
    }

    func updateCorners() {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadiusValue, height: cornerRadiusValue))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }

}

