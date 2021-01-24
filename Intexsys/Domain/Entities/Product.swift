//
//  Product.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Foundation

typealias Products = [Product]

// MARK: Initialization

struct Product {
    let name: String
    let url: String
    let price: Double
}

// MARK: Codable

extension Product: Codable {
    enum CodingKeys: String, CodingKey {
        case name = "shortName"
        case url
        case price
    }
}

// MARK: Network Container

extension Product {
    struct GridProducts: Decodable {
        let elements: Products
    }

    struct ProductNetworkResponse: Decodable {
        var gridProducts: GridProducts
    }
}
