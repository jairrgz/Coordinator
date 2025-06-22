//
//  LoginViewController.swift
//  CoordinatorTest
//
//  Created by Jair Ramírez-Gastón on 21/06/25.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - PROPERTIES
    var loginCoordinator: LoginCoordinator?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.goToDetail()
        }

    }
    
    func goToDetail() {
        loginCoordinator?.navegateToDetail()
    }
    
    
}
