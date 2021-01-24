//
//  CategoryListViewModel.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Foundation

// MARK: Input

protocol CategoryListViewModelInput {
    func viewDidLoad()
    func didSelectItem(at indexPath: IndexPath)
}

// MARK: Output

enum CategoryListViewModelState {
    case loading
    case result(Result<[CategoryListItemViewModel], Error>)
}

protocol CategoryListViewModelOutput: AnyObject {
    var changeState: ((CategoryListViewModelState) -> Void)? { get set }
}

// MARK: Protocol

typealias CategoryListViewModel = CategoryListViewModelInput & CategoryListViewModelOutput

// MARK: -

// MARK: Initialization

final class CategoryListController: CategoryListViewModel {
    var changeState: ((CategoryListViewModelState) -> Void)?
    var showProduct: ((Category) -> Void)?

    private var items: [CategoryListItemViewModel] = []
    private var categories: Categories = []
    private let repository: ProductRepository

    init(repository: ProductRepository) {
        self.repository = repository
    }
}

// MARK: CategoryListViewModelInput

extension CategoryListController {
    func viewDidLoad() {
        changeState?(.loading)

        repository.fetchCategories { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let categories):
                self.categories = categories
                self.items = categories.map(CategoryListItemViewModel.init(_:))
                self.changeState?(.result(.success(self.items)))
            case .failure(let error):
                self.changeState?(.result(.failure(error)))
            }
        }
    }

    func didSelectItem(at indexPath: IndexPath) {
        showProduct?(categories[indexPath.row])
    }
}

// MARK: -

// MARK: Initialization

final class RemoteProductRepository {
    let dispatcher: RequestDispatcher

    init(dispatcher: RequestDispatcher) {
        self.dispatcher = dispatcher
    }
}

// MARK: ProductRepository

extension RemoteProductRepository: ProductRepository {
    func fetchCategories(with completion: @escaping (Result<Categories, Error>) -> Void) {
        let request = Request(method: .get, endpoint: .categories, params: nil)
        dispatcher.execute(request, completion: completion)
    }

    func fetchProducts(for category: Category, with completion: @escaping (Result<Product.NetworkResponse, Error>) -> Void) {
        let request = Request(method: .get, endpoint: .products(category: category), params: nil)
        dispatcher.execute(request, completion: completion)
    }
}
