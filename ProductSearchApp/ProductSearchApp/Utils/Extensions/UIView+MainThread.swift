//
//  UIView+MainThread.swift
//  ProductSearchApp
//
//  Created by Elliot on 01-04-21.
//

import UIKit

extension UIView {
    func addSubViewInBackgroundThread(view: UIView) {
        DispatchQueue.global(qos: .background).async {
           DispatchQueue.main.async {
            self.addSubview(view)
           }
        }
    }
    
    func removeSubviewMainThreadSecure() {
        DispatchQueue.global(qos: .background).async {
           DispatchQueue.main.async {
            self.removeFromSuperview()
           }
        }
    }
}
