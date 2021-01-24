//
//  CategoryListItemViewModel.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Foundation

typealias CategoryListItemViewModels = [CategoryListItemViewModel]

// MARK: Initialization

struct CategoryListItemViewModel {
    let title: String
}

// MARK: Mapping

extension CategoryListItemViewModel {
    init(_ category: Category) {
        self.title = category.name
    }
}
