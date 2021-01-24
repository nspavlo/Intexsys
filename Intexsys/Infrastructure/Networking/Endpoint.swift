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
    // TOTO: Remove loose type
    case products(category: String)
}

// MARK: -

extension Endpoint {
    func path() -> String {
        switch self {
        case .categories:
            return "/categories"
        case .products(let category):
            return "/catalog/\(category)/products?_iv_include=gridProducts"
        }
    }
}
