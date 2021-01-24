//
//  Endpoint.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Foundation

// MARK: Initialization

enum Endpoint {
    case categories
    case products(category: Category, page: Int)
    case product(product: Product)
}

// MARK: -

extension Endpoint {
    var version: String {
        "0.5"
    }

    func path() -> String {
        switch self {
        case .categories:
            return "/api/\(version)/categories"
        case .products(let category, let page):
            return "/iv-api/\(version)/catalog/\(category.url)/products?_iv_include=gridProducts&_iv_page=\(page)"
        case .product(let product):
            return "/api/\(version)/products/\(product.url)"
        }
    }
}
