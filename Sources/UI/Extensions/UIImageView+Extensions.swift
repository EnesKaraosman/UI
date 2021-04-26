//
//  UIImageView+Extensions.swift
//  
//
//  Created by Enes Karaosman on 30.12.2020.
//

import UIKit

public extension UIImageView {
    /// Sets image.
    @discardableResult
    func with(image: UIImage?) -> Self {
        with {
            $0.image = image
        }
    }
    
    /// contentMode = .scaleAspectFit
    @discardableResult
    func scaleAspectFit() -> Self {
        with {
            $0.contentMode = .scaleAspectFit
        }
    }
    
    /// contentMode = .scaleAspectFill
    @discardableResult
    func scaleAspectFill() -> Self {
        with {
            $0.contentMode = .scaleAspectFill
        }
    }
}
