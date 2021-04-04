//
//  ItemDetailService.swift
//  ProductSearchApp
//
//  Created by Elliot on 01-04-21.
//

import RxSwift

protocol ItemDetailServiceProtocol {
    func getItemDetail(itemId: String) -> Single<ItemDetail>
}

class ItemDetailService: ItemDetailServiceProtocol {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func getItemDetail(itemId: String) -> Single<ItemDetail> {
        apiClient.send(apiRequest: ItemDetailRequest(itemId: itemId))
    }
}
