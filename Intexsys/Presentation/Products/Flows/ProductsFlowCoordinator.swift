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

    private func showCategoryList(animated: Bool) {}
}
