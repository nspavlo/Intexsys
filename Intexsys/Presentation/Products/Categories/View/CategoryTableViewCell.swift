//
//  CategoryTableViewCell.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import UIKit

// MARK: Initialization

final class CategoryTableViewCell: UITableViewCell {}

// MARK: Reusable

extension CategoryTableViewCell: Reusable {}

// MARK: Configuration

extension CategoryTableViewCell {
    func configure(with viewModel: CategoryListItemViewModel) {
        accessoryType = .disclosureIndicator
        textLabel?.text = viewModel.title
    }
}
