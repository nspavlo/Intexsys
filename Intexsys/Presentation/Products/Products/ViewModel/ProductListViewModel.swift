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
    func didLoadNextPage()
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


    private var page = 1
    private var hasMorePages = false
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
        load(page: page)
    }

    func didLoadNextPage() {
        guard hasMorePages else { return }

        page += 1
        load(page: page)
    }

    func didSelectItem(at indexPath: IndexPath) {
        showProductDetails?(products[indexPath.row])
    }
}

// MARK: Private Methods

private extension ProductListController {
    func load(page: Int) {
        repository.fetchProducts(for: category, page: page) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let response):
                self.appendNewPage(from: response)
                self.changeState?(.result(.success(self.items)))
            case .failure(let error):
                self.changeState?(.result(.failure(error)))
            }
        }
    }

    func appendNewPage(from response: Product.NetworkResponse) {
        hasMorePages = hasMorePages(with: response)
        products.append(contentsOf: response.grid.elements)
        items = products.map(ProductListItemViewModel.init(_:))
    }


    func isFirstPage() -> Bool {
        page == 1
    }

    func hasMorePages(with response: Product.NetworkResponse) -> Bool {
        response.total % (response.size * page + 1) == 1
    }
}
