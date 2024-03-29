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

// MARK: Decodable

extension Product: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "shortName"
        case url
        case price
        case primaryImage
    }
}

// MARK: Network Container

// swiftlint:disable nesting
extension Product {
    struct Grid: Decodable {
        let elements: Products
    }

    struct Response: Decodable {
        let grid: Grid
        let size: Int
        let total: Int

        enum CodingKeys: String, CodingKey {
            case grid = "gridProducts"
            case size = "grid_size"
            case total
        }
    }
}
