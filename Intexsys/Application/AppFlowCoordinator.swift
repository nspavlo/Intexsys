//
//  AppFlowCoordinator.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import UIKit

// MARK: Protocol

protocol Coordinator {
    func start()
}

// MARK: -

// MARK: Initialization

final class AppFlowCoordinator {
    private let navigationController: UINavigationController
    private let appFlowFactory: AppFlowFactory

    init(navigationController: UINavigationController, appFlowFactory: AppFlowFactory) {
        self.navigationController = navigationController
        self.appFlowFactory = appFlowFactory
    }
}

// MARK: Coordinator

extension AppFlowCoordinator: Coordinator {
    func start() {}
}
