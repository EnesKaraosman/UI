//
//  LeftAlignedIconButton.swift
//  
//
//  Created by Enes Karaosman on 13.01.2021.
//

import UIKit

/// Text is centered in button, icon is left aligned.
public class LeftAlignedIconButton: Button {
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        contentHorizontalAlignment = .left
    }
    
    public override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let titleRect = super.titleRect(forContentRect: contentRect)
        let imageSize = currentImage?.size ?? .zero
        let availableWidth = contentRect.width
            - imageEdgeInsets.right
            - (CGFloat(2) * imageSize.width)
            - titleRect.width
        return titleRect.offsetBy(dx: round(availableWidth / 2), dy: 0)
    }
    
    public var shadowBtnCornerRadius: CGFloat = 10
    public var shadowEnabled: Bool = false
    var shadowAdded: Bool = false

    open override func draw(_ rect: CGRect) {
        super.draw(rect)

         if shadowAdded || !shadowEnabled { return }
         shadowAdded = true

         let shadowLayer = UIView(frame: self.frame)
        shadowLayer.backgroundColor = .clear
        shadowLayer.layer.shadowColor = UIColor(hex: "#A78F82").cgColor
        shadowLayer.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.shadowBtnCornerRadius).cgPath
         shadowLayer.layer.shadowOffset = CGSize(width: 2.0, height: 3.0)
         shadowLayer.layer.shadowOpacity = 0.25
         shadowLayer.layer.shadowRadius = 10
         shadowLayer.layer.masksToBounds = true
         shadowLayer.clipsToBounds = false

         self.superview?.addSubview(shadowLayer)
         self.superview?.bringSubviewToFront(self)
     }
    
}
