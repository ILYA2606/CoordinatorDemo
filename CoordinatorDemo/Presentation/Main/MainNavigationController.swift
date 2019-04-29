//
//  MainNavigationController.swift
//  CoordinatorDemo
//
//  Created by Ilya Shkolnik on 29/04/2019.
//  Copyright © 2019 Openbank. All rights reserved.
//

import UIKit

/// Основной контроллер навигации
class MainNavigationController: UINavigationController {
    var rootViewController = MainFirstViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configRootViewController()
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.mainCoordinator = MainCoordinator(rootViewController: self)
        appDelegate?.mainCoordinator?.start()
    }
    
    private func configRootViewController() {
        for controller in viewControllers {
            guard let mainFirstViewController = controller as? MainFirstViewController else { continue }
            rootViewController = mainFirstViewController
            return
        }
    }
}
