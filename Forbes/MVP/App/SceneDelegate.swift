//
//  SceneDelegate.swift
//  Forbes
//
//  Created by Мурад on 20.02.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: scene)

        let mainScreen = MainViewController()
        let navigationController = UINavigationController()
        navigationController.viewControllers = [mainScreen]

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
