//
//  ListProductCell.swift
//  ProductSearchApp
//
//  Created by Elliot on 30-03-21.
//

import UIKit

class ListProductCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productRate: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var shipping: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productImage.image = nil
        productName.sizeToFit()
    }
    
    func bind(viewModel item: ItemViewModel) {
        productImage.downloaded(from: item.displayImageUrl!)
        productName.text = item.displayTitle
        productPrice.text = item.displayPrice
        productRate.text = item.displayInstallments
        shipping.text = item.displayShipping  
    }
}

