//
//  UIImageView+Download.swift
//  ProductSearchApp
//
//  Created by Elliot on 30-03-21.
//

import UIKit

extension UIImageView {

    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        ImageDownloader.downloadImage(from: url, into: self)
    }
}
