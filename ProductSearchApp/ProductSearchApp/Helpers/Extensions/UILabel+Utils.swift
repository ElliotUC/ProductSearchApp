//
//  String+Utils.swift
//  ProductSearchApp
//
//  Created by Elliot on 02-04-21.
//

import UIKit

extension UILabel {
    func strikeThroughText() {
        let attributeString =  NSMutableAttributedString(string: self.text ?? "")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
        self.attributedText = attributeString
    }
}
