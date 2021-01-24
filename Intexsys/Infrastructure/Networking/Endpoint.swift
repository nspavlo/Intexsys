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
    var version: String {
        "0.5"
    }

    func path() -> String {
        switch self {
        case .categories:
            return "/api/\(version)/categories"
        case .products(let category):
            return "/iv-api/\(version)/catalog/\(category.url)/products?_iv_include=gridProducts"
        }
    }
}
