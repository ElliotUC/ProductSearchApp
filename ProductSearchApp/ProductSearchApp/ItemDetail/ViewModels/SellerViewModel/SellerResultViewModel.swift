//
//  SellerResultViewModel.swift
//  ProductSearchApp
//
//  Created by Elliot on 04-04-21.
//

import Foundation
import RxSwift

final class SellerResultViewModel {
    
    private let sellerService: SellerServiceProtocol
    
    init(sellerService: SellerServiceProtocol) {
        self.sellerService = sellerService
    }
    
    func getSellerViewModel(sellerId: String) -> Single<SellerViewModel> {
        sellerService.getSeller(sellerId: sellerId).map { SellerViewModel(seller: $0)
        }
    }
}
