//
//  AppFlowFactory.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Foundation

// MARK: Initialization

final class AppFlowFactory {
    lazy var dispatcher: RequestDispatcher = AFRequestDispatcher(environment: .development)
}

// MARK: -

extension AppFlowFactory {
    func createProductsFlowFactory() -> ProductsFlowFactory {
        ProductsFlowFactory(dispatcher: dispatcher)
    }
}
