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
    let primaryImage: String
}

// MARK: Codable

extension Product: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "shortName"
        case url
        case price
        case primaryImage
    }
}

// MARK: Network Container

extension Product {
    struct Grid: Decodable {
        let elements: Products
    }

    struct NetworkResponse: Decodable {
        var grid: Grid

        enum CodingKeys: String, CodingKey {
            case grid = "gridProducts"
        }
    }
}
