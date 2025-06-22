//
//  DetailViewController.swift
//  CoordinatorTest
//
//  Created by Jair Ramírez-Gastón on 21/06/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    var loginCoordinator: LoginCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            self.loginEnded()
        }
    }
    
    func loginEnded() {
        loginCoordinator?.loginEnded()
    }

}
