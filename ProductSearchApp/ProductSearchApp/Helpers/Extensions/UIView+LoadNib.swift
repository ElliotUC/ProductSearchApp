//
//  UIView+LoadNib.swift
//  ProductSearchApp
//
//  Created by Elliot on 01-04-21.
//

import UIKit

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
