//
//  SceneDelegate.swift
//  CoordinatorTest
//
//  Created by Jair Ramírez-Gastón on 21/06/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: scene)
        
        let navigationController = UINavigationController()
        let mainCoordinator = MainCoordinator(nagivationController: navigationController)
        
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        mainCoordinator.start()
    }

}

