//
//  Button.swift
//  
//
//  Created by Enes Karaosman on 28.12.2020.
//

import UIKit

open class Button: UIButton {
    public typealias TapHandler = (() -> Void)
    
    /// Set nil for circular cornerRadius.
    public var cornerRadius: CGFloat? = nil {
        didSet { super.setNeedsLayout() }
    }
    
    public var borderColor: UIColor = UIColor.clear {
        didSet { super.setNeedsLayout() }
    }
    
    public var borderColorHighlighted: UIColor = UIColor.clear {
        didSet { super.setNeedsLayout() }
    }
    
    public var borderWidth: CGFloat = 0.0 {
        didSet { super.setNeedsLayout() }
    }
    
    open override var backgroundColor: UIColor? {
        didSet {
            self.setBackgroundColor(
                color: backgroundColor ?? .clear,
                for: .normal
            )
        }
    }
    
    public var highlightedBackgroundColor: UIColor = UIColor.clear {
        didSet {
            self.setBackgroundColor(
                color: highlightedBackgroundColor,
                for: .highlighted
            )
        }
    }
    
    public var disabledBackgroundColor: UIColor = UIColor.clear {
        didSet {
            self.setBackgroundColor(
                color: disabledBackgroundColor,
                for: .disabled
            )
        }
    }
    
    public var onTapGesture: TapHandler? {
        didSet {
            self.removeTarget(self, action: #selector(_onTapGesture), for: .touchUpInside)
            guard onTapGesture != nil else { return }
            self.addTarget(self, action: #selector(_onTapGesture), for: .touchUpInside)
        }
    }
    
    public init(_ title: String, onTapGesture: TapHandler? = nil) {
        super.init(frame: .zero)
        commonInit()
        self.setTitle(title, for: .normal)
        self.onTapGesture = onTapGesture
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    @objc private func _onTapGesture() {
        self.onTapGesture?()
    }
    
    open func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        titleLabel?.font = .init(.body, .regular)
        backgroundColor = UIColor.Basic.orange
        highlightedBackgroundColor = UIColor.gray5.withAlphaComponent(0.3)
        // prevent icon become gray on tap or hold
        adjustsImageWhenHighlighted = false
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius == nil ? bounds.height / 2 : cornerRadius!
        layer.borderColor = isHighlighted ? borderColorHighlighted.cgColor : borderColor.cgColor
        layer.borderWidth = borderWidth
    }
    
}

// MARK: - Button Extensions
import LBTATools

public extension Button {
    
    /// Tiny - 38px Height, Body/15/Regular
    func tiny() -> Self {
        with {
            $0.contentEdgeInsets = .horizontal(Spacing.small)
            $0.titleLabel?.font = .init(.rubik, .custom(15), .regular)
            $0.withHeight(38)
        }
    }
    
    /// Small - 60px Height, Heading/20/Regular
    func small() -> Self {
        with {
            $0.contentEdgeInsets = .horizontal(32)
            $0.titleLabel?.font = .init(.rubik, .custom(20), .regular)
            $0.withHeight(60)
        }
    }
    
    /// Medium - 60px Height, Heading/20/Medium
    func medium() -> Self {
        with {
            $0.contentEdgeInsets = .horizontal(32)
            $0.titleLabel?.font = .init(.rubik, .custom(20), .medium)
            $0.withHeight(60)
        }
    }
    
    /// Medium - 60px Height, Heading/16/Medium
    func medium16() -> Self {
        with {
            $0.contentEdgeInsets = .horizontal(32)
            $0.titleLabel?.font = .init(.rubik, .custom(16), .medium)
            $0.withHeight(60)
        }
    }
}
