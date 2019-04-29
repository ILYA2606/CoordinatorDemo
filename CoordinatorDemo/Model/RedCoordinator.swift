//
//  MainCoordinator.swift
//  CoordinatorDemo
//
//  Created by Ilya Shkolnik on 29/04/2019.
//  Copyright © 2019 Openbank. All rights reserved.
//

import UIKit

/// Координатор фичи Red
final class RedCoordinator: BaseCoordinator {
    
    weak var redNavigationController: UINavigationController!
    
    override func start() {
        guard let mainNavigationController = rootViewController as? MainNavigationController else { fatalError() }
        let redFirstViewController: RedFirstViewController = UIStoryboard.instantiateController(from: .red)
        redFirstViewController.message = object as? String
        redFirstViewController.showTapHandler = { [weak self] in
            self?.showSecondScreen()
        }
        redFirstViewController.closeTapHandler = { [weak self] in
            self?.close()
        }
        redFirstViewController.deinitHandler = { [weak self] in
            self?.finishHandler?()
        }
        
        let redNavigationController = UINavigationController(rootViewController: redFirstViewController)
        mainNavigationController.present(redNavigationController, animated: true)
        self.redNavigationController = redNavigationController
    }
    
    // MARK: - Private Methods
    
    private func showSecondScreen() {
        let redSecondViewController: RedSecondViewController = UIStoryboard.instantiateController(from: .red)
        redNavigationController?.show(redSecondViewController, sender: nil)
    }
    
    private func close() {
        redNavigationController?.dismiss(animated: true)
    }
}
