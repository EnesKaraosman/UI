//
//  PaddingLabel.swift
//  
//
//  Created by Enes Karaosman on 9.01.2021.
//

import UIKit

public class PaddingLabel: Label {

    public var topInset: CGFloat = 8.0
    public var bottomInset: CGFloat = 8.0
    public var leftInset: CGFloat = 16.0
    public var rightInset: CGFloat = 16.0

    public override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    public override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

    public override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }
}
