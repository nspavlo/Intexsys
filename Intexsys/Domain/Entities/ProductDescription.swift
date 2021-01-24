//
//  ProductDescription.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Foundation

// MARK: Initialization

struct ProductDescription {
    let description: String
}

// MARK: Codable

extension ProductDescription: Decodable {
    enum CodingKeys: String, CodingKey {
        case description = "clean_description"
    }
}
