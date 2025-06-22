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
        let feedViewController = FeedViewController()
        feedViewController.feedCoordinator = self
        nagivationController.pushViewController(feedViewController, animated: false)
    }
    
    
    
    
    
}
