//
//  LinearGradientView.swift
//  
//
//  Created by Enes Karaosman on 5.03.2021.
//

import UIKit

public class LinearGradientView: UIView {
    
    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    // For this implementation, both colors are required to display
    // a gradient. You may want to extend cgColorGradient to support
    // other use cases, like gradients with three or more colors.
    internal var cgColorGradient: [CGColor]? {
        guard let startColor = startColor, let endColor = endColor else {
            return nil
        }
        
        return [startColor.cgColor, endColor.cgColor]
    }
    
    public var startColor: UIColor? {
        didSet { gradientLayer.colors = cgColorGradient }
    }
    
    public var endColor: UIColor? {
        didSet { gradientLayer.colors = cgColorGradient }
    }
    
    public var startPoint: CGPoint = CGPoint(x: 1.0, y: 1.0) {
        didSet { gradientLayer.startPoint = startPoint }
    }
    
    public var endPoint: CGPoint = CGPoint(x: 0.0, y: 0.0) {
        didSet { gradientLayer.endPoint = endPoint }
    }
    
}
