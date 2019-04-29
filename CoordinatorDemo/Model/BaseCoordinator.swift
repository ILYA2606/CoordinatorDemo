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
    /// Контроллер, стартующий сценарий координатора
    weak var rootViewController: UIViewController?
    /// Блок завершения сценария координатора
    var finishHandler: VoidHandler?
    /// Дочерние координаторы
    private(set) var childCoordinators = [String: BaseCoordinator]()
    
    /// Запуск сценария координатора
    func start() {
        fatalError("Нужно переопределить в наследнике")
    }
    
    /**
     Добавление дочернего координатора
     - parameter coordinator: Координатор
     */
    func addCoordinator(_ coordinator: BaseCoordinator) {
        let name = String(describing: coordinator.classForCoder)
        childCoordinators[name] = coordinator
    }
    
    /**
     Удаление дочернего координатора по типу
     - parameter coordinatorClass: Тип координатора
     */
    func removeCoordinator(by coordinatorClass: BaseCoordinator.Type) {
        let name = String(describing: coordinatorClass)
        childCoordinators[name] = nil
    }
}
