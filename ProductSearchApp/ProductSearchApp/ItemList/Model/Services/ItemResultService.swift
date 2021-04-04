//
//  ItemResultService.swift
//  ProductSearchApp
//
//  Created by Elliot on 30-03-21.
//

import RxSwift

protocol ItemResultServiceProtocol {
    func fetchItems(searchItems by: String, offset: Int) -> Single<ItemResult>
}

class ItemResultService: ItemResultServiceProtocol {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchItems(searchItems by: String, offset: Int) -> Single<ItemResult> {
        return apiClient.send(apiRequest: ItemResultRequest(searchItems: by, offset: offset))
    }
}
