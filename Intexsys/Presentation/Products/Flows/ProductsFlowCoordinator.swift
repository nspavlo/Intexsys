//
//  ProductsFlowCoordinator.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import UIKit

// MARK: Initialization

final class ProductsFlowCoordinator {
    private let navigationController: UINavigationController
    private let productsFlowFactory: ProductsFlowFactory

    init(
        navigationController: UINavigationController,
        productsFlowFactory: ProductsFlowFactory
    ) {
        self.navigationController = navigationController
        self.productsFlowFactory = productsFlowFactory
    }
}

// MARK: Coordinator

extension ProductsFlowCoordinator: Coordinator {
    func start() {
        showCategoryList(animated: false)
    }

    private func showCategoryList(animated: Bool) {
        let repository = productsFlowFactory.createProductRepository()
        let viewModel = CategoryListController(repository: repository)
        viewModel.showProduct = { category in
            self.showProduct(with: category, animated: true)
        }
        let viewController = CategoryContainerViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: animated)
    }

    private func showProduct(with category: Category, animated: Bool) {
        let repository = productsFlowFactory.createProductRepository()
        let viewModel = ProductListController(category: category, repository: repository)
        viewModel.showProductDetails = { product in
            self.showProductDetails(with: product, animated: true)
        }
        let viewController = ProductContainerViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: animated)
    }

    private func showProductDetails(with _: Product, animated _: Bool) {}
}
