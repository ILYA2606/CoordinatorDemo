//
//  StoryboardIdentifiable.swift
//  Openbank
//
//  Created by Roman Churkin on 29/01/16.
//  Copyright © 2016 RedMadRobot LLC. All rights reserved.
//

import UIKit

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension UIViewController: StoryboardIdentifiable {}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
