//
//  BaseCoordinator.swift
//  CoordinatorDemo
//
//  Created by Ilya Shkolnik on 29/04/2019.
//  Copyright © 2019 Openbank. All rights reserved.
//

import UIKit

/// Базовый координатор
class BaseCoordinator: NSObject {
    weak var rootViewController: UIViewController?
    var finishHandler: VoidHandler?
    
    private(set) var childCoordinators = [String: BaseCoordinator]()
    
    func start() {
        fatalError("Нужно переопределить в наследнике")
    }
    
    func addCoordinator(_ coordinator: BaseCoordinator) {
        let name = String(describing: coordinator.classForCoder)
        childCoordinators[name] = coordinator
    }
    
    func removeCoordinator(by coordinatorClass: BaseCoordinator.Type) {
        let name = String(describing: coordinatorClass)
        childCoordinators[name] = nil
    }
}
