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
    
    let customTabarrControoller = CustomTabBarController()
    
    
    // MARK: - Designated Initializer
    init(nagivationController: UINavigationController) {
        self.nagivationController = nagivationController
    }
    
    
    func start() {
        
    }
}
