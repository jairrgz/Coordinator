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
    var parentCoordinator: (any Coordinator)?
    
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
    
    
    
    
}
