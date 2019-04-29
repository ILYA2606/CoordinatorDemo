//
//  MainCoordinator.swift
//  CoordinatorDemo
//
//  Created by Ilya Shkolnik on 29/04/2019.
//  Copyright © 2019 Openbank. All rights reserved.
//

import UIKit

/// Координатор фичи Blue
final class BlueCoordinator: BaseCoordinator {
    
    override func start() {
        guard let mainNavigationController = rootViewController as? MainNavigationController else { fatalError() }
        let blueFirstViewController: BlueFirstViewController = UIStoryboard.instantiateController(from: .blue)
        blueFirstViewController.message = object as? String
        blueFirstViewController.tapHandler = { [weak self] in
            self?.showSecondScreen()
        }
        blueFirstViewController.deinitHandler = { [weak self] in
            self?.finishHandler?()
        }
        mainNavigationController.show(blueFirstViewController, sender: nil)
    }
    
    // MARK: - Private Methods
    
    private func showSecondScreen() {
        guard let mainNavigationController = rootViewController as? MainNavigationController else { fatalError() }
        let blueSecondViewController: BlueSecondViewController = UIStoryboard.instantiateController(from: .blue)
        mainNavigationController.show(blueSecondViewController, sender: nil)
    }
}
