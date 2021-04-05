//
//  ConstantsAPI.swift
//  ProductSearchApp
//
//  Created by Elliot on 04-04-21.
//

import Foundation
import UIKit

struct Constants {
    static let heightRow: CGFloat = 150
    static let totalCells = 20
}

struct ConstantsAPI {
    static let baseURL = "https://api.mercadolibre.com/"
    static let searchItems = "sites/MLC/search"
    static let searchByItem = "/items/"
    static let searchSeller = "/users/"
}
