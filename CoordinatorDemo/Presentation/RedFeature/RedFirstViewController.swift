//
//  RedFirstViewController.swift
//  CoordinatorDemo
//
//  Created by Ilya Shkolnik on 29/04/2019.
//  Copyright © 2019 Openbank. All rights reserved.
//

import UIKit

/// Контроллер первого экрана фичи Red
class RedFirstViewController: UIViewController {
    @IBOutlet private var messageLabel: UILabel!
    
    var showTapHandler: VoidHandler?
    var closeTapHandler: VoidHandler?
    var deinitHandler: VoidHandler?
    var message: String?
    
    deinit {
        deinitHandler?()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = message
    }
    
    @IBAction func tappedToShowSecondScreen(_ sender: Any) {
        showTapHandler?()
    }
    
    @IBAction func tappedToClose(_ sender: Any) {
        closeTapHandler?()
    }
}

