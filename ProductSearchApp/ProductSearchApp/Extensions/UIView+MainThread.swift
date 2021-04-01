//
//  UIView+MainThread.swift
//  ProductSearchApp
//
//  Created by Elliot on 01-04-21.
//

import UIKit

extension UIView {
    func addSubviewMainThreadSecure(view: UIView) {
        DispatchQueue.main.async {
            self.addSubview(view)
       }
    }
    
    func removeSubviewMainThreadSecure() {
        DispatchQueue.main.async {
            self.removeFromSuperview()
       }
    }
}
