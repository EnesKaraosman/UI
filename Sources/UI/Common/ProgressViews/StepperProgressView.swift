//
//  StepperProgressView.swift
//  
//
//  Created by Enes Karaosman on 23.01.2021.
//

import UIKit

public class StepperProgressView: UIView {

    public var emptyStepColor: UIColor = .init(hex: "#F3EDE8")
    
    /// Color picked based on `value`, also expresses number of steps.
    public var stepColors: [UIColor] = [
        .extraRed, UIColor(hex: "#FDAA49"), UIColor(hex: "#DCE024"), .extraGreen
    ]
    
    private var numberOfBars: Int { stepColors.count }
    public var space : CGFloat  = 2
    
    /// Set percentage, like 53
    public var value: Int = 1 {
        didSet {
            value = Int(round(Double(numberOfBars * value) / 100.0))
            setNeedsDisplay()
        }
    }

    private func drawRect(rect: CGRect, rectBgColor: UIColor, index: Int) {

        let rectWidth = rect.width
        let rectHeight = rect.height
        let ctx: CGContext = UIGraphicsGetCurrentContext()!
        ctx.saveGState()

        let rect = CGRect(x: rect.origin.x, y: rect.origin.y, width: rectWidth, height: rectHeight)
        var clipPath: CGPath?
        if index == 0 {
            clipPath = UIBezierPath(roundedRect:rect, byRoundingCorners:[.topLeft, .bottomLeft], cornerRadii: CGSize(width : rectWidth, height : rectWidth)).cgPath
        }
        else if index == numberOfBars - 1 {
            clipPath = UIBezierPath(roundedRect:rect, byRoundingCorners:[.topRight, .bottomRight], cornerRadii: CGSize(width : rectWidth, height : rectWidth)).cgPath
        }
        else {
            clipPath = UIBezierPath(rect:rect).cgPath
        }
        ctx.addPath(clipPath!)
        ctx.setFillColor(rectBgColor.cgColor)
        ctx.closePath()
        ctx.fillPath()
        ctx.restoreGState()

    }

    override public func draw(_ rect: CGRect) {
        
        let width = bounds.width - ((CGFloat(numberOfBars - 1)) * space)
        let barHeight = bounds.height
        let barWidth = (width  / CGFloat (numberOfBars))

        for index in 0..<numberOfBars {
            let startPoint = CGPoint(x: CGFloat(index) * (barWidth + space) , y: 0)
            let rect = CGRect(origin: startPoint, size: CGSize(width: barWidth, height: barHeight))
            var color = emptyStepColor
            if value > index {
                let __index = min(max(value - 1, 0), stepColors.count - 1)
                color = stepColors[__index]
            }
            drawRect(rect: rect, rectBgColor: color, index: index)
        }

    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .clear
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

}


