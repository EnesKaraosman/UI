//
//  UINavigationController+Extensions.swift
//  
//
//  Created by Enes Karaosman on 9.02.2021.
//

import UIKit

// https://stackoverflow.com/a/38042863/5645821
class AlwaysPoppableNavigationController: UINavigationController {

    private var alwaysPoppableDelegate: AlwaysPoppableDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.alwaysPoppableDelegate = AlwaysPoppableDelegate(navigationController: self, originalDelegate: self.interactivePopGestureRecognizer!.delegate!)
        self.interactivePopGestureRecognizer!.delegate = self.alwaysPoppableDelegate
    }
}

extension AlwaysPoppableNavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
         navigationController.view.semanticContentAttribute = UIView.isRightToLeft() ? .forceRightToLeft : .forceLeftToRight
         navigationController.navigationBar.semanticContentAttribute = UIView.isRightToLeft() ? .forceRightToLeft : .forceLeftToRight
    }
}

private class AlwaysPoppableDelegate: NSObject, UIGestureRecognizerDelegate {

    weak var navigationController: AlwaysPoppableNavigationController?
    weak var originalDelegate: UIGestureRecognizerDelegate?

    init(navigationController: AlwaysPoppableNavigationController, originalDelegate: UIGestureRecognizerDelegate) {
        self.navigationController = navigationController
        self.originalDelegate = originalDelegate
    }

    // For handling iOS before 13.4
    @objc func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if let navigationController = navigationController, navigationController.isNavigationBarHidden && navigationController.viewControllers.count > 1 {
            return true
        }
        else if let originalDelegate = originalDelegate {
            return originalDelegate.gestureRecognizer!(gestureRecognizer, shouldReceive: touch)
        }
        else {
            return false
        }
    }

    // For handling iOS 13.4+
    @objc func _gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceiveEvent event: UIEvent) -> Bool {
        if let navigationController = navigationController, navigationController.isNavigationBarHidden && navigationController.viewControllers.count > 1 {
            return true
        }
        else if let originalDelegate = originalDelegate {
            let selector = #selector(_gestureRecognizer(_:shouldReceiveEvent:))
            if originalDelegate.responds(to: selector) {
                let result = originalDelegate.perform(selector, with: gestureRecognizer, with: event)
                return result != nil
            }
        }

        return false
    }

    override func responds(to aSelector: Selector) -> Bool {
        if #available(iOS 13.4, *) {
            // iOS 13.4+ does not need to override responds(to:) behavior, it only uses forwardingTarget
            return originalDelegate?.responds(to: aSelector) ?? false
        }
        else {
            if aSelector == #selector(gestureRecognizer(_:shouldReceive:)) {
                return true
            }
            else {
                return originalDelegate?.responds(to: aSelector) ?? false
            }
        }
    }

    override func forwardingTarget(for aSelector: Selector) -> Any? {
        if #available(iOS 13.4, *), aSelector == #selector(_gestureRecognizer(_:shouldReceiveEvent:)) {
            return nil
        }
        else {
            return self.originalDelegate
        }
    }
}
