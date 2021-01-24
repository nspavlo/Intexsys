//
//  ProductListViewModel.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Foundation

// MARK: Input

protocol ProductListViewModelInput {
    func viewDidLoad()
    func didSelectItem(at indexPath: IndexPath)
}

// MARK: Output

enum ProductListViewModelState {
    case loading
    case result(Result<[ProductListItemViewModel], Error>)
}

protocol ProductListViewModelOutput: AnyObject {
    var changeState: ((ProductListViewModelState) -> Void)? { get set }
}

// MARK: Protocol

typealias ProductListViewModel = ProductListViewModelInput & ProductListViewModelOutput

// MARK: -

// MARK: Initialization

final class ProductListController: ProductListViewModel {
    var changeState: ((ProductListViewModelState) -> Void)?
    var showProductDetails: ((Product) -> Void)?

    private var items: [ProductListItemViewModel] = []
    private var products: Products = []
    private let category: Category
    private let repository: ProductRepository

    init(category: Category, repository: ProductRepository) {
        self.category = category
        self.repository = repository
    }
}

// MARK: ProductListViewModelInput

extension ProductListController {
    func viewDidLoad() {
        changeState?(.loading)

        repository.fetchProducts(for: category) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let response):
                let products = response.grid.elements
                self.products = products
                self.items = products.map(ProductListItemViewModel.init(_:))
                self.changeState?(.result(.success(self.items)))
            case .failure(let error):
                self.changeState?(.result(.failure(error)))
            }
        }
    }

    func didSelectItem(at indexPath: IndexPath) {
        showProductDetails?(products[indexPath.row])
    }
}
