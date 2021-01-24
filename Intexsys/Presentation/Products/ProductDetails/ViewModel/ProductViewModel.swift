//
//  ProductViewModel.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Foundation

// MARK: Protocol

protocol ProductViewModel {
    var name: String { get }
    var imageURL: URL? { get }
    var price: String { get }
    var description: String { get }
}

// MARK: -

// MARK: Initialization

struct ProductController: ProductViewModel {
    let product: Product

    init(product: Product) {
        self.product = product
    }
}

// MARK: ProductViewModel

extension ProductController {
    var name: String {
        product.name
    }

    var imageURL: URL? {
        URL(string: "https://op1.0ps.us/365-240-ffffff/\(product.primaryImage).jpg")
    }

    var price: String {
        "\(product.price)"
    }

    var description: String {
        ""
    }
}
