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
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
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
        viewModel.viewDidLoad()
    }
}

// MARK: Private Methods

private extension ProductViewController {
    func setup() {
        setupUI()
        setupBindings()
    }

    func setupBindings() {
        viewModel.changeState = { [weak self] _ in
            self?.update()
        }
    }

    func setupUI() {
        title = viewModel.name
        view.backgroundColor = .white

        setupScrollView()
        setupStackView()
        setupImageView()
        setupTitleLabel()
        setupDescriptionLabel()
    }

    func setupScrollView() {
        view.addSubview(scrollView)
        setupScrollViewConstraints()
    }

    func setupScrollViewConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 16
        scrollView.addSubview(stackView)
        setupStackViewConstraints()
    }

    func setupStackViewConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
            make.width.equalTo(view).inset(16)
        }
    }

    func setupImageView() {
        imageView.contentMode = .scaleAspectFit
        stackView.addArrangedSubview(imageView)
    }

    func setupTitleLabel() {
        titleLabel.numberOfLines = 0
        stackView.addArrangedSubview(titleLabel)
    }

    func setupDescriptionLabel() {
        descriptionLabel.numberOfLines = 0
        stackView.addArrangedSubview(descriptionLabel)
    }

    func update() {
        imageView.sd_setImage(with: viewModel.imageURL, placeholderImage: UIImage())
        titleLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description
    }
}
