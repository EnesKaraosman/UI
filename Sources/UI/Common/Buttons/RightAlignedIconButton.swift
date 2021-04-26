//
//  RightAlignedIconButton.swift
//  
//
//  Created by Enes Karaosman on 13.01.2021.
//

import UIKit

/// Text is centered in button, icon is right aligned.
public class RightAlignedIconButton: Button {
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        contentHorizontalAlignment = .right
        semanticContentAttribute = .forceRightToLeft
    }
    
    public override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let titleRect = super.titleRect(forContentRect: contentRect)
        let imageSize = currentImage?.size ?? .zero
        let availableWidth = contentRect.width
            - imageEdgeInsets.right
            - (CGFloat(2) * imageSize.width)
            - titleRect.width
        return titleRect.offsetBy(dx: -round(availableWidth / 2), dy: 0)
    }
    
}
