//
//  ProductsFlowFactory.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import UIKit

// MARK: Initialization

final class ProductsFlowFactory {}

// MARK: Coordinators

extension ProductsFlowFactory {
    func createProductsFlowCoordinator(with navigationController: UINavigationController) -> Coordinator {
        ProductsFlowCoordinator(navigationController: navigationController, productsFlowFactory: self)
    }
}
