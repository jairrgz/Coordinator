//
//  CustomTabBarCoordinator.swift
//  CoordinatorTest
//
//  Created by Jair Ramírez-Gastón on 21/06/25.
//
import Foundation
import UIKit


class CustomTabBarCoordinator: Coordinator {
    
    // MARK: - PROPERTIES
    var nagivationController: UINavigationController
    var parentCoordinator: MainCoordinator?
    var childCoordinators: [Coordinator] = []
    
    let customTabarrController = CustomTabBarController()
    
    
    // MARK: - Designated Initializer
    init(nagivationController: UINavigationController) {
        self.nagivationController = nagivationController
    }
    
    
    func start() {
        customTabarrController.coordinator = self
        // LOGIN
        let loginNavigationController = UINavigationController()
        loginNavigationController.tabBarItem = UITabBarItem(title: "Login", image: UIImage(systemName: "plus"), selectedImage: UIImage(systemName: "plus"))
        
        let loginCoordinator = LoginCoordinator(nagivationController: loginNavigationController)
        childCoordinators.append(loginCoordinator)
        
        // FEED
        let feedNavigationController = UINavigationController()
        feedNavigationController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "minus"), selectedImage: UIImage(systemName: "minus"))
        
        let feedCoordinator = FeedCoordinator(nagivationController: feedNavigationController)
        childCoordinators.append(feedCoordinator)
        
        customTabarrController.viewControllers = [loginNavigationController, feedNavigationController]
        nagivationController.pushViewController(customTabarrController, animated: false)
        
        // Start de c/u de los coordinators
        loginCoordinator.start()
        feedCoordinator.start()
        
    }
}

