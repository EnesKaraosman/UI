//
//  CircularButtonWithIcon.swift
//  
//
//  Created by Enes Karaosman on 11.01.2021.
//

import UIKit

open class CircleButton: RoundedButton {
    
    public init(icon: UIImage?, iconHeight: CGFloat = 24, buttonHeight: CGFloat = 56) {
        super.init(icon: icon, corners: [], cornerRadius: nil, iconHeight: iconHeight, buttonHeight: buttonHeight)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Use init(icon: UIImage?, cornerRadius: CGFloat?, iconHeight: CGFloat, buttonHeight: CGFloat) initializer")
    }
    
}
