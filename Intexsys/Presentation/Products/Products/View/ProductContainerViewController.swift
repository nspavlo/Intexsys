//
//  ProductContainerViewController.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import UIKit

// MARK: Initialization

final class ProductContainerViewController: UIViewController {
    private let viewModel: ProductListViewModel
    private weak var productTableViewController: ProductTableViewController?

    init(viewModel: ProductListViewModel) {
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

private extension ProductContainerViewController {
    func setup() {
        setupUI()
        setupBindings()
    }

    func setupUI() {
        title = Locale.navigationBarTitle
        view.backgroundColor = .white
    }

    func setupBindings() {
        viewModel.changeState = { [weak self] state in
            self?.render(state)
        }
    }

    func render(_ state: ProductListViewModelState) {
        switch state {
        case .loading:
            let viewController = LoaderViewController()
            replaceExisting(with: viewController, in: view)
        case .result(.success(let items)):
            if let productTableViewController = productTableViewController {
                productTableViewController.reload(with: items)
            } else {
                let viewController = ProductTableViewController(items: items)
                viewController.didSelectItem = viewModel.didSelectItem(at:)
                viewController.didLoadNextPage = viewModel.didLoadNextPage
                replaceExisting(with: viewController, in: view)

                productTableViewController = viewController
            }
        case .result(.failure(let error)):
            let viewController = ErrorViewController(error: error)
            replaceExisting(with: viewController, in: view)
        }
    }
}

// MARK: Locale

private typealias Locale = String

private extension Locale {
    static let navigationBarTitle = "Products"
}
