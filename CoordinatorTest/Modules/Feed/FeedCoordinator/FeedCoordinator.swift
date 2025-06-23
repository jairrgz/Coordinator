//
//  FeedCoordinator.swift
//  CoordinatorTest
//
//  Created by Jair Ramírez-Gastón on 21/06/25.
//

import UIKit

class FeedCoordinator: Coordinator {
    
    // MARK: - PROPERTIES
    var childCoordinators: [any Coordinator] = []
    var nagivationController: UINavigationController
    var parentCoordinator: MainCoordinator?
    
    // MARK: - Designated Initializer
    init(nagivationController: UINavigationController) {
        self.nagivationController = nagivationController
    }
    
    // MARK: - Methods
    func start() {
        let viewModel = FeedViewModel()
        let feedViewController = FeedViewController(viewModel: viewModel)
        feedViewController.feedCoordinator = self
        nagivationController.pushViewController(feedViewController, animated: false)
    }
    
    func navigateToLogin() {
        // Obtenemos el TabBarController
        if let tabBarController = nagivationController.tabBarController as? CustomTabBarController,
           // Obtenemos el índice del tab de Login (que es 0 según CustomTabBarCoordinator)
           let loginNavigationController = tabBarController.viewControllers?[0] as? UINavigationController {
            // Cambiamos al tab de Login
            tabBarController.selectedIndex = 0
            // Hacemos pop a root en el navigation controller del Login
            loginNavigationController.popToRootViewController(animated: true)
        }
    }
}
