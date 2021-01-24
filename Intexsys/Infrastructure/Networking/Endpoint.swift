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
    case products(category: Category)
}

// MARK: -

extension Endpoint {
    func path() -> String {
        switch self {
        case .categories:
            return "/api/0.5/categories"
        case .products(let category):
            return "/iv-api/0.5/catalog/\(category.url)/products?_iv_include=gridProducts"
        }
    }
}
