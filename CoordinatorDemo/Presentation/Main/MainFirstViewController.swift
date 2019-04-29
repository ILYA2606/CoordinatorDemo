//
//  MainFirstViewController.swift
//  CoordinatorDemo
//
//  Created by Ilya Shkolnik on 29/04/2019.
//  Copyright © 2019 Openbank. All rights reserved.
//

import UIKit

/// Контроллер первого экрана основной фичи
class MainFirstViewController: UIViewController {
    
    var mainTapHandler: VoidHandler?
    var blueTapHandler: StringHandler?
    var redTapHandler: StringHandler?

    @IBAction func tappedMainFeature(_ sender: Any) {
        mainTapHandler?()
    }
    
    @IBAction func tappedBlueFeature(_ sender: Any) {
        blueTapHandler?("Какие-то данные из первого экрана")
    }
    
    @IBAction func tappedRedFeature(_ sender: Any) {
        redTapHandler?("Какие-то данные из первого экрана")
    }
    
}

