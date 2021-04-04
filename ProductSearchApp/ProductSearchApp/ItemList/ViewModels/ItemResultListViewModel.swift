//
//  ItemResultListViewModel.swift
//  ProductSearchApp
//
//  Created by Elliot on 30-03-21.
//

import Foundation
import RxSwift

final class ItemResultListViewModel {
    
    private let itemResultService: ItemResultServiceProtocol
    
    init(itemResultService: ItemResultServiceProtocol) {
        self.itemResultService = itemResultService
    }
    
    func fetchItemsViewModel(searchItems by: String, offset: Int = 0) -> Single<[ItemViewModel]> {
        itemResultService.fetchItems(searchItems: by, offset: offset).map { $0.results.map {
            ItemViewModel(item: $0)}
        }
    }
    
}
