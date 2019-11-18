//
//  OneLineAlertAnimate.swift
//  OneLineAlert
//
//  Created by AmebaHead on 16/10/2019.
//  Copyright © 2019 AmebaHead. All rights reserved.
//

import UIKit

class OneLineAlertAnimate: NSObject, UIViewControllerAnimatedTransitioning {
    let isPresenting: Bool
    
    init(isPresenting: Bool) {
        self.isPresenting = isPresenting
    }
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresenting {
            self.presentAnimateTransition(transitionContext)
        } else {
            self.dismissAnimateTransition(transitionContext)
        }
    }
}

// MARK: - Function
extension OneLineAlertAnimate {
    func presentAnimateTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        let alertController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! OneLineAlertView
        let containerView = transitionContext.containerView
        
        alertController.overlayView.alpha = 0.0
        alertController.alertView.alpha = 0.0
        alertController.alertView.center = alertController.view.center
        
        containerView.addSubview(alertController.view)
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            alertController.overlayView.alpha = 1.0
            alertController.alertView.alpha = 1.0
        }) { (finished) in
            if finished {
                transitionContext.completeTransition(true)
            }
        }
    }
    
    func dismissAnimateTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        let alertConroller = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! OneLineAlertView
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            alertConroller.overlayView.alpha = 0.0
            alertConroller.alertView.alpha = 0.0
        }) { (finished) in
            if finished {
                transitionContext.completeTransition(true)
            }
        }
    }
}
