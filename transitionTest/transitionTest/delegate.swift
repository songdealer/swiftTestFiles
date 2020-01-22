//
//  delegate.swift
//  transitionTest
//
//  Created by MinG._. on 02/01/2020.
//  Copyright © 2020 MinG._. All rights reserved.
//

import Foundation
import UIKit

class delegate: NSObject, UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) ->
        UIViewControllerAnimatedTransitioning? {
            print("delegate")
        return PopAnimator()
    }
}
