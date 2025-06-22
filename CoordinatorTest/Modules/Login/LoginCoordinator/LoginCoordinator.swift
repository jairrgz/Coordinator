//
//  LoginCoordinator.swift
//  CoordinatorTest
//
//  Created by Jair Ramírez-Gastón on 21/06/25.
//


import UIKit

class LoginCoordinator: Coordinator {
    
    // MARK: - PROPERTIES
    var nagivationController: UINavigationController
    var parentCoordinator: (any Coordinator)?
    var childCoordinators: [Coordinator] = []
    
    // MARK: - Designated Initializer
    init(nagivationController: UINavigationController) {
        self.nagivationController = nagivationController
    }

    // MARK: - Methods
    func start() {
        let loginViewController = LoginViewController()
        loginViewController.loginCoordinator = self
        nagivationController.pushViewController(loginViewController, animated: false)
    }
    
}
