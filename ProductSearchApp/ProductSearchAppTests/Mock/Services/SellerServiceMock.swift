//
//  SellerServiceMock.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 04-04-21.
//

import Foundation
import RxSwift

@testable import ProductSearchApp

class SellerServiceMock: SellerServiceProtocol {
    
    private var seller: Seller!
    
    init() {
        seller = Seller(nickname: "HUIONCL1")
    }
    
    func getSeller(sellerId: String) -> Single<Seller> {
        return Single.just(seller)
    }
}
