//
//  ProductViewModel.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Foundation

// MARK: Input

protocol ProductViewModelInput {
    func viewDidLoad()
}

// MARK: Output

enum ProductViewModelState {
    case loading
    case result(Result<ProductDescription, Error>)
}

protocol ProductViewModelOutput: AnyObject {
    var name: String { get }
    var imageURL: URL? { get }
    var price: String { get }
    var description: String { get }
    var changeState: ((ProductViewModelState) -> Void)? { get set }
}

// MARK: Protocol

typealias ProductViewModel = ProductViewModelInput & ProductViewModelOutput

// MARK: -

// MARK: Initialization

final class ProductController: ProductViewModel {
    var changeState: ((ProductViewModelState) -> Void)?

    private let product: Product
    private var productDscription: ProductDescription?
    private let repository: ProductRepository

    init(product: Product, repository: ProductRepository) {
        self.product = product
        self.repository = repository
    }
}

// MARK: ProductViewModelOutput

extension ProductController {
    var name: String {
        product.name
    }

    var imageURL: URL? {
        URL(string: "\(Environment.images.path)/365-240-ffffff/\(product.primaryImage).jpg")
    }

    var price: String {
        "\(product.price)"
    }

    var description: String {
        productDscription?.description ?? ""
    }
}

// MARK: ProductViewModelInput

extension ProductController {
    func viewDidLoad() {
        changeState?(.loading)

        repository.fetchLargeProduct(for: product) { [weak self] result in
            switch result {
            case .success(let response):
                self?.productDscription = response
                self?.changeState?(.result(.success(response)))
            case .failure(let error):
                self?.changeState?(.result(.failure(error)))
            }
        }
    }
}
