//
//  ItemResultViewModel.swift
//  ProductSearchApp
//
//  Created by Elliot on 01-04-21.
//

import Foundation
import RxSwift

final class ItemResultViewModel {
    
    private let detailItemService: DetailItemServiceProtocol
    
    init(detailItemService: DetailItemServiceProtocol) {
        self.detailItemService = detailItemService
    }
    
    func getItemViewModel(itemId: String) -> Single<ItemViewModel> {
        detailItemService.getItem(itemId: itemId).map {ItemViewModel(detailItem: $0)}
    }
}
