//
//  SceneDelegate.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import UIKit

// MARK: Initialization

class SceneDelegate: UIResponder {
    var window: UIWindow?
}

// MARK: Private Methods

extension SceneDelegate {
    func setupMainWindow(with navigationController: UINavigationController) {
        window?.rootViewController = navigationController
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
}

// MARK: UIWindowSceneDelegate

extension SceneDelegate: UIWindowSceneDelegate {
    func scene(
        _ scene: UIScene,
        willConnectTo _: UISceneSession,
        options _: UIScene.ConnectionOptions
    ) {
        window = (scene as? UIWindowScene)
            .map(UIWindow.init(windowScene:))

        let navigationController = UINavigationController()
        setupMainWindow(with: navigationController)
    }
}
