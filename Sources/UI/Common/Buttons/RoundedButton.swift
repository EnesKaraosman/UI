//
//  RoundedButton.swift
//  
//
//  Created by Enes Karaosman on 11.01.2021.
//

import UIKit

open class RoundedButton: Button {
    
    open override var intrinsicContentSize: CGSize {
        return .init(width: buttonHeight, height: buttonHeight)
    }
    
    public var icon: UIImage? = nil {
        didSet {
            iconImageView.image = icon
        }
    }
    
    private var iconHeight: CGFloat = 24
    private var buttonHeight: CGFloat = 56
    private var corners: [RectCorner] = [.topLeft, .topRight, .bottomLeft, .bottomRight]
    private var _cornerRadius: CGFloat? = 8

    public lazy var iconImageView = UIImageView().scaleAspectFit().with {
        $0.tintColor = .white
    }
    
    public override var tintColor: UIColor! {
        didSet {
            iconImageView.tintColor = tintColor
        }
    }
    public init(
        icon: UIImage?,
        corners: [RectCorner] = [.topLeft, .topRight, .bottomLeft, .bottomRight],
        cornerRadius: CGFloat? = 8,
        iconHeight: CGFloat = 24,
        buttonHeight: CGFloat = 56
    ) {
        defer {
            self.icon = icon
        }
        self.corners = corners
        self._cornerRadius = cornerRadius
        self.iconHeight = iconHeight
        self.buttonHeight = buttonHeight
        super.init(frame: .zero)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    open override func commonInit() {
        super.commonInit()
        backgroundColor = UIColor.Basic.orange
        addSubview(iconImageView)
        iconImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(iconHeight)
        }
    }
    
    private func handleCornersRounding() {
        if let cornerRadius = _cornerRadius {
            roundCorners(corners: corners, cornerRadius: cornerRadius)
        } else {
            cornerRadius = _cornerRadius // For CircleButton
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        handleCornersRounding()
    }
    
}
