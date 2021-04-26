//
//  UIButton+Extensions.swift
//  
//
//  Created by Enes Karaosman on 3.01.2021.
//

import UIKit

public extension UIButton {
    
    /// Sets the background color to use for the specified button state.
    func setBackgroundColor(color: UIColor, for state: UIControl.State) {
        
        let minimumSize = CGSize(width: 1.0, height: 1.0)
        
        UIGraphicsBeginImageContext(minimumSize)
        
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(origin: .zero, size: minimumSize))
        }
        
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.clipsToBounds = true
        self.setBackgroundImage(colorImage, for: state)
    }
}


