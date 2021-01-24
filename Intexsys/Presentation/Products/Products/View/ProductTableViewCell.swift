//
//  ProductTableViewCell.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import UIKit
import SDWebImage

// MARK: Initialization

final class ProductTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView?.sd_cancelCurrentImageLoad()
    }
}

// MARK: Reusable

extension ProductTableViewCell: Reusable {}

// MARK: Configuration

extension ProductTableViewCell {
    func configure(with viewModel: ProductListItemViewModel) {
        accessoryType = .disclosureIndicator
        textLabel?.text = viewModel.title
        textLabel?.numberOfLines = 0
        detailTextLabel?.text = viewModel.price
        imageView?.sd_setImage(with: viewModel.imageURL, placeholderImage: UIImage(named: "placeholder"))
    }
}
