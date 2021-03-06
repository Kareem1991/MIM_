//
//  UILabelExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 9/23/16.
//  Copyright © 2016 SwifterSwift
//

import UIKit

#if !os(watchOS)
// MARK: - Methods
public extension UILabel {

	/// SwifterSwift: Initialize a UILabel with text
    convenience init(text: String?) {
		self.init()
		self.text = text
	}

	/// SwifterSwift: Required height for a label
    var requiredHeight: CGFloat {
		let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: CGFloat.greatestFiniteMagnitude))
		label.numberOfLines = 0
		label.lineBreakMode = NSLineBreakMode.byWordWrapping
		label.font = font
		label.text = text
		label.attributedText = attributedText
		label.sizeToFit()
		return label.frame.height
	}

}

#endif
