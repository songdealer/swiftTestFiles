//
//  PopAnimator.swift
//  transitionTest
//
//  Created by MinG._. on 02/01/2020.
//  Copyright © 2020 MinG._. All rights reserved.
//

import Foundation
import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let second = transitionContext.viewController(forKey: .to) else { return }
        transitionContext.containerView.addSubview(second.view)
        second.view.alpha = 0
        print("start animating")
        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            print("animating")
            second.view.alpha = 1
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
    
}
