//
//  UIViewController+Extensions.swift
//  
//
//  Created by Enes Karaosman on 6.01.2021.
//

import UIKit
import SafariServices

public extension UIViewController {
    
    /// Sets current viewController as rootViewController and returns that `UINavigationController`
    func embedInNavigationController() -> UINavigationController {
        UINavigationController(rootViewController: self)
    }
    
    /// Embeds current `UIViewController` instance inside `UINavigationController`,
    /// purpose is to re gain benefit of swipe gesture to go previous page.
    /// - Returns: UINavigationController after sets current view controller as rootViewController.
    func embedInNavigationControllerForCustomBar() -> UINavigationController {
        AlwaysPoppableNavigationController(rootViewController: self)
    }
    
    func add(_ child: UIViewController, frame: CGRect? = nil) {
        addChild(child)

        if let frame = frame {
            child.view.frame = frame
        }

        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
    
}
