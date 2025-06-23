//
//  MainCoordinator.swift
//  CoordinatorTest
//
//  Created by Jair Ramírez-Gastón on 21/06/25.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    // MARK: - PROPERTIES
    var childCoordinators: [any Coordinator] = []
    var nagivationController: UINavigationController
    var parentCoordinator: MainCoordinator?
    
    // MARK: - Designated Initialyzer
    init(nagivationController: UINavigationController) {
        self.nagivationController = nagivationController
    }
    
    // MARK: - Methods
    func start() {
        /// Llamar al primer flujo de Login
        let loginCoordinator = LoginCoordinator(nagivationController: nagivationController)
        childCoordinators.append(loginCoordinator)
        loginCoordinator.parentCoordinator = self
        loginCoordinator.start()
    }
    
    func removeChilde(coordinator: Coordinator) {
        for(index, coord) in childCoordinators.enumerated() where coord === coordinator {
            childCoordinators.remove(at: index)
        }
    }
    
    func startFeed() {
        let feedCoordinator = FeedCoordinator(nagivationController: nagivationController)
        childCoordinators.append(feedCoordinator)
        feedCoordinator.parentCoordinator = self
        feedCoordinator.start()
    }
    
    func startTabBarFlow() {
        let tabBarCoordinator = CustomTabBarCoordinator(nagivationController: nagivationController)
        childCoordinators.append(tabBarCoordinator)
        tabBarCoordinator.parentCoordinator = self
        tabBarCoordinator.start()
    }
    
}
