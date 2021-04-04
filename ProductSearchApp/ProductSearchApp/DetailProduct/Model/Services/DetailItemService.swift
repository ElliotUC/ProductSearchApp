//
//  DetailItemService.swift
//  ProductSearchApp
//
//  Created by Elliot on 01-04-21.
//

import RxSwift

protocol DetailItemServiceProtocol {
    func getItem(itemId: String) -> Single<DetailProduct>
}

class DetailItemService: DetailItemServiceProtocol {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func getItem(itemId: String) -> Single<DetailProduct> {
        apiClient.send(apiRequest: DetailItemRequest(itemId: itemId))
    }
}
