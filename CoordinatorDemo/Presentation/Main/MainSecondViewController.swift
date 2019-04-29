//
//  MainSecondViewController.swift
//  CoordinatorDemo
//
//  Created by Ilya Shkolnik on 29/04/2019.
//  Copyright © 2019 Openbank. All rights reserved.
//

import UIKit

/// Контроллер второго экрана основной фичи
class MainSecondViewController: UIViewController {

    var blueTapHandler: StringHandler?
    var redTapHandler: StringHandler?
    
    @IBAction func tappedBlueFeature(_ sender: Any) {
        blueTapHandler?("Какие-то данные из второго экрана")
    }
    
    @IBAction func tappedRedFeature(_ sender: Any) {
        redTapHandler?("Какие-то данные из второго экрана")
    }

}

