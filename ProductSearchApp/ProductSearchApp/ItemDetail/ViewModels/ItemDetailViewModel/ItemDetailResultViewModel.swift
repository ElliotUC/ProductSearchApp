//
//  ItemDetailResultViewModel.swift
//  ProductSearchApp
//
//  Created by Elliot on 01-04-21.
//

import Foundation
import RxSwift

final class ItemDetailResultViewModel {
    
    private let itemDetailService: ItemDetailServiceProtocol
    
    init(itemDetailService: ItemDetailServiceProtocol) {
        self.itemDetailService = itemDetailService
    }
    
    func getItemDetailViewModel(itemId: String) -> Single<ItemDetailViewModel> {
        itemDetailService.getItemDetail(itemId: itemId).map {ItemDetailViewModel(itemDetail: $0)}
    }
}
