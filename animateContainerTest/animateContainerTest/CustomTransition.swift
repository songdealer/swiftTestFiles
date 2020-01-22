//
//  CustomTransition.swift
//  animateContainerTest
//
//  Created by MinG._. on 07/01/2020.
//  Copyright © 2020 MinG._. All rights reserved.
//

import Foundation
import UIKit

class CustomTransition: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) as? ViewController, let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        let view = UIView(frame: fromVC.view.frame)
        let duration = transitionDuration(using: transitionContext)
        
        view.backgroundColor = .blue
        let oldFrame = fromVC.testView.frame
        let oldColor = fromVC.testView.backgroundColor
        
        let temp = UIView(frame: CGRect(x: 207, y: 207, width: 200, height: 400))
        temp.backgroundColor = .black
        
        //transitionContext.containerView.addSubview(fromVC.testView)
        //transitionContext.containerView.addSubview(view)
        //transitionContext.containerView.addSubview(temp)
        //transitionContext.containerView.addSubview(toVC.view)
        
        UIView.animateKeyframes(
            withDuration: duration,
            delay: 0,
            options: .overrideInheritedOptions,
            animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                    fromVC.testView.frame = CGRect(x: 0, y: 0, width: 414, height: 800)
                    
                })
        },
            completion: { (bool) in
                fromVC.testView.frame = oldFrame
                fromVC.testView.backgroundColor = oldColor
                transitionContext.containerView.addSubview(toVC.view)
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
        
    }
}
