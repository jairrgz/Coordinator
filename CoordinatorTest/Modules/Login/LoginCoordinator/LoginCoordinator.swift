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
    var parentCoordinator: MainCoordinator?
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
    
    func navegateToDetail() {
        let viewController = DetailViewController()
        viewController.loginCoordinator = self
        nagivationController.pushViewController(viewController, animated: true)
    }
    
    func loginEnded() {
        // Coordinator padre debe eliminar a self como hijo (P.e: Si Login ya no es parte de flujo en este momento entonces debe salir.
        parentCoordinator?.removeChilde(coordinator: self)
        
        // feed Coordinator y su metodo start()
        parentCoordinator?.startFeed()
    }
    
}
