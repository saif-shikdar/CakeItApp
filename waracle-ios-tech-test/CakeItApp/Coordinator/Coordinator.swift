//
//  Coordinator.swift
//  CakeItApp
//
//  Created by MAC on 08/09/21.
//

import Foundation
import UIKit

protocol Coordinator:AnyObject {
    var navigationController: UINavigationController { get set }
    func start()
    func goToCakeDetails(cakeDetails: CakeDetails)
}

class MainCoordinator: Coordinator {
    
    
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CakeListViewController.instantiate()
        vc.coordinator = self
        vc.viewModel = CakeListViewModel(delegate:vc)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goToCakeDetails(cakeDetails: CakeDetails) {
        let vc = CakeDetailViewController.instantiate()
        vc.viewModel = CakeDetailsViewModel(cakeDetails: cakeDetails)
        navigationController.pushViewController(vc, animated: false)
    }
}
