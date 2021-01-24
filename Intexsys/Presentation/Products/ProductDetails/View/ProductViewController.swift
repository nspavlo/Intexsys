//
//  ProductViewController.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import UIKit
import SnapKit
import SDWebImage

// MARK: Initialization

final class ProductViewController: UIViewController {
    private let viewModel: ProductViewModel

    init(viewModel: ProductViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: Private Methods

private extension ProductViewController {
    func setup() {
        title = "NAME"
        view.backgroundColor = .white

        let stackView = UIStackView()
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(16)
        }

        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.sd_setImage(with: viewModel.imageURL, placeholderImage: UIImage())
        stackView.addArrangedSubview(imageView)

        stackView.addArrangedSubview(createTitleLabel())
        stackView.addArrangedSubview(createDescriptionLabel())
    }

    func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.text = viewModel.name
        label.numberOfLines = 0
        return label
    }

    func createDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.text = viewModel.description
        label.numberOfLines = 0
        return label
    }
}
