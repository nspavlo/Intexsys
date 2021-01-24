//
//  CategoryContainerViewController.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import UIKit

// MARK: Initialization

final class CategoryContainerViewController: UIViewController {
    private let viewModel: CategoryListViewModel

    init(viewModel: CategoryListViewModel) {
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

private extension CategoryContainerViewController {
    func setup() {
        setupUI()
        setupBindings()
    }

    func setupUI() {
        title = Locale.navigationBarTitle
    }

    func setupBindings() {
        viewModel.changeState = { [weak self] state in
            self?.render(state)
        }
    }

    func render(_ state: CategoryListViewModelState) {
        switch state {
        case .loading:
            let viewController = LoaderViewController()
            replaceExisting(with: viewController, in: view)
        case .result(.success(let items)):
            let viewController = CategoryTableViewController(items: items)
            viewController.didSelectItem = viewModel.didSelectItem(at:)
            replaceExisting(with: viewController, in: view)
        case .result(.failure(let error)):
            let viewController = ErrorViewController(error: error)
            replaceExisting(with: viewController, in: view)
        }
    }
}

// MARK: Locale

private typealias Locale = String

private extension Locale {
    static let navigationBarTitle = "Categories"
}
