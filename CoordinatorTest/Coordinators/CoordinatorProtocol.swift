//
//  CoordinatorProtocol.swift
//  CoordinatorTest
//
//  Created by Jair Ramírez-Gastón on 21/06/25.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get set }
    var nagivationController: UINavigationController { get set }
    var parentCoordinator: MainCoordinator? { get set }
    
    func start()
    
}

