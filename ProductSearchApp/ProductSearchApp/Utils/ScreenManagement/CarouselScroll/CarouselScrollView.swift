//
//  CarouselScrollView.swift
//  ProductSearchApp
//
//  Created by Elliot on 01-04-21.
//

import UIKit

protocol CarouselScrollViewDataSource: AnyObject {
    func numberOfImagesInSection() -> Int
    func imageURLForSection(position: Int) -> URL
}

class CarouselScrollView: UIScrollView {
    weak var carouselDataSource: CarouselScrollViewDataSource?
    
    func reloadData() {
        if let dataSource = carouselDataSource {
            let numberImages = dataSource.numberOfImagesInSection()
            for number in 0..<numberImages {
                let imageUrl = dataSource.imageURLForSection(position: number)
                let offset = number == 0 ? 0 : (CGFloat(number) * self.bounds.width)
                let imageView = UIImageView(frame: CGRect(x: offset, y: 0, width: self.bounds.width, height: self.bounds.height))
                imageView.downloaded(from: imageUrl)
                imageView.clipsToBounds = true
                imageView.contentMode = .scaleAspectFit
    
                self.addSubview(imageView)
            }
   
            self.contentSize = CGSize(width: CGFloat(numberImages) * self.bounds.width, height: self.bounds.height)
        } else {
            fatalError("dataSource can't be nil")
        }
    }
}

