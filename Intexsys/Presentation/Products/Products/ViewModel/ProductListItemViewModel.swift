//
//  ProductListItemViewModel.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Foundation

typealias ProductListItemViewModels = [ProductListItemViewModel]

// MARK: Initialization

struct ProductListItemViewModel {
    let title: String
    let price: String
    let imageURL: URL?
}

// MARK: Mapping

extension ProductListItemViewModel {
    init(_ product: Product) {
        self.title = product.name
        self.price = "\(product.price)"
        self.imageURL = URL(string: "https://op1.0ps.us/120-90-ffffff/\(product.primaryImage).jpg")
    }
}
