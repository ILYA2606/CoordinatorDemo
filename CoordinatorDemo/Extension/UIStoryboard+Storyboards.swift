//
//  UIStoryboard+Storyboards.swift
//  Openbank
//
//  Created by Roman Churkin on 29/01/16.
//  Copyright © 2016 RedMadRobot LLC. All rights reserved.
//

import UIKit

extension UIStoryboard {
    enum Storyboard: String {
        case main = "Main"
        case blue = "Blue"
        case red = "Red"
    }

    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }

    var initialViewController: UIViewController {
        return instantiateInitialViewController()!
    }

    class func instantiateController<Controller: UIViewController>(from storyboard: Storyboard) -> Controller {
        let storyboard = UIStoryboard(storyboard: storyboard)
        let viewController = storyboard.instantiateViewController(withIdentifier: Controller.storyboardIdentifier)
        guard let controller = viewController as? Controller else { fatalError() }
        return controller
    }

    class func initialController<Controller: UIViewController>(from storyboard: Storyboard) -> Controller {
        let storyboard = UIStoryboard(storyboard: storyboard)
        guard let controller = storyboard.instantiateInitialViewController() as? Controller else { fatalError() }
        return controller
    }
}
