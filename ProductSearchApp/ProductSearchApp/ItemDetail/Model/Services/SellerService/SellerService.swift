//
//  SellerService.swift
//  ProductSearchApp
//
//  Created by Elliot on 04-04-21.
//

import RxSwift

protocol SellerServiceProtocol {
    func getSeller(sellerId: String) -> Single<Seller>
}

class SellerService: SellerServiceProtocol {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func getSeller(sellerId: String) -> Single<Seller> {
        apiClient.send(apiRequest: SellerRequest(sellerId: sellerId))
    }
}
