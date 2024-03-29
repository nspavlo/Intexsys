//
//  Category.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Foundation

typealias Categories = [Category]

// MARK: Initialization

struct Category {
    let name: String
    let url: String
}

// MARK: Decodable

extension Category: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "short_name"
        case url
    }
}
