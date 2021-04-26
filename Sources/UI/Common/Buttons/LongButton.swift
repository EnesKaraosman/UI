//
//  LongButton.swift
//  
//
//  Created by Enes Karaosman on 12.01.2021.
//

import UIKit

/// Covers all available width automatically.
open class LongButton: Button {
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 60)
    }
    
    open override func commonInit() {
        super.commonInit() 
        titleLabel?.font = .init(.rubik, .custom(20), .medium)
        titleLabel?.textColor = .white
    }
    
    public var shadowOffset = CGSize(width: 2.0, height: 3.0)
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
         shadowLayer.layer.shadowOffset = shadowOffset
         shadowLayer.layer.shadowOpacity = 0.25
         shadowLayer.layer.shadowRadius = 10
         shadowLayer.layer.masksToBounds = true
         shadowLayer.clipsToBounds = false

         self.superview?.addSubview(shadowLayer)
         self.superview?.bringSubviewToFront(self)
     }
}
