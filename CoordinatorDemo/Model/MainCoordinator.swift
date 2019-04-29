//
//  MainCoordinator.swift
//  CoordinatorDemo
//
//  Created by Ilya Shkolnik on 29/04/2019.
//  Copyright © 2019 Openbank. All rights reserved.
//

import UIKit

/// Основной координатор приложения
final class MainCoordinator: BaseCoordinator {
    
    private var mainNavigationController: MainNavigationController {
        guard let controller = rootViewController as? MainNavigationController else { fatalError() }
        return controller
    }
    
    override func start() {
        let mainFirstViewController: MainFirstViewController = mainNavigationController.rootViewController
        mainFirstViewController.mainTapHandler = { [weak self] in
            self?.showSecondScreen()
        }
        mainFirstViewController.blueTapHandler = { [weak self] message in
            self?.showBlueFeature(message: message)
        }
        mainFirstViewController.redTapHandler = { [weak self] message in
            self?.showRedFeature(message: message)
        }
    }
    
    // MARK: - Private Methods
    
    private func showSecondScreen() {
        let mainSecondViewController: MainSecondViewController = UIStoryboard.instantiateController(from: .main)
        mainSecondViewController.blueTapHandler = { [weak self] message in
            self?.showBlueFeature(message: message)
        }
        mainSecondViewController.redTapHandler = { [weak self] message in
            self?.showRedFeature(message: message)
        }
        mainNavigationController.show(mainSecondViewController, sender: nil)
    }
    
    private func showBlueFeature(message: String?) {
        let coordinator = BlueCoordinator(rootViewController: mainNavigationController, object: message)
        coordinator.start()
        coordinator.finishHandler = { [weak self] in
            self?.removeCoordinator(by: BlueCoordinator.self)
        }
        addCoordinator(coordinator)
    }
    
    private func showRedFeature(message: String?) {
        let coordinator = RedCoordinator(rootViewController: mainNavigationController, object: message)
        addCoordinator(coordinator)
        coordinator.start()
        coordinator.finishHandler = { [weak self] in
            self?.removeCoordinator(by: RedCoordinator.self)
        }
    }
}
