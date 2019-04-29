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
    /// Основной координатор является синглтоном, т.к. он должен быть всегда в памяти и быть доступен из любого места
    static let shared = MainCoordinator()
    
    private(set) var mainNavigationController = MainNavigationController()
    
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
    
    func provideMainNavigationController(_ controller: MainNavigationController) {
        mainNavigationController = controller
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
        let coordinator = BlueCoordinator()
        coordinator.rootViewController = mainNavigationController
        coordinator.message = message
        coordinator.start()
        coordinator.finishHandler = { [weak self] in
            self?.removeCoordinator(by: BlueCoordinator.self)
        }
        addCoordinator(coordinator)
    }
    
    private func showRedFeature(message: String?) {
        let coordinator = RedCoordinator()
        coordinator.rootViewController = mainNavigationController
        addCoordinator(coordinator)
        coordinator.message = message
        coordinator.start()
        coordinator.finishHandler = { [weak self] in
            self?.removeCoordinator(by: RedCoordinator.self)
        }
    }
}
