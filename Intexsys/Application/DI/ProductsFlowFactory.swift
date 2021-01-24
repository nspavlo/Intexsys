//
//  ProductsFlowFactory.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import UIKit

// MARK: Initialization

final class ProductsFlowFactory {
    private let dispatcher: RequestDispatcher

    init(dispatcher: RequestDispatcher) {
        self.dispatcher = dispatcher
    }
}

// MARK: Repositories

extension ProductsFlowFactory {
    func createProductRepository() -> ProductRepository {
        RemoteProductRepository(dispatcher: dispatcher)
    }
}

// MARK: Coordinators

extension ProductsFlowFactory {
    func createProductsFlowCoordinator(with navigationController: UINavigationController) -> Coordinator {
        ProductsFlowCoordinator(navigationController: navigationController, productsFlowFactory: self)
    }
}
