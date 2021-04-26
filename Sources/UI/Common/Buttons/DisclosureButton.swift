//
//  DisclosureButton.swift
//  
//
//  Created by Enes Karaosman on 1.01.2021.
//

import UIKit

public class DisclosureButton2: Button {
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 5, left: (bounds.width - 15), bottom: 5, right: 0)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: (imageView?.frame.width)!)
        }
    }
    
}

public class DisclosureButton: UIControl {
    
    public typealias TapHandler = (() -> Void)
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 44)
    }
    
    public lazy var titleLabel = Label().with {
        $0.font = .init(.rubik, .custom(16), .regular)
    }
    public lazy var iconImageView = UIImageView().scaleAspectFit()
    
    public var text: String? {
        didSet {
            titleLabel.text = text
        }
    }
    
    public var icon: UIImage? {
        didSet {
            iconImageView.image = icon
        }
    }
    
    public var onTapGesture: TapHandler?
    
    public var highlightedBackgroundColor: UIColor = UIColor.gray5.withAlphaComponent(0.3)
    
    public override var isHighlighted: Bool {
        didSet {
            if oldValue != isHighlighted {
                updateAppearance()
            }
        }
    }
    
    public override var isSelected: Bool {
        didSet {
            super.isSelected = isSelected
            if oldValue != isEnabled {
                updateAppearance()
            }
        }
    }
    
    public override var isEnabled: Bool {
        didSet {
            if oldValue != isEnabled {
                updateAppearance()
            }
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    public init(_ text: String, icon: UIImage? = nil, onTapGesture: TapHandler? = nil) {
        super.init(frame: .zero)
        commonInit()
        defer {
            self.text = text
            self.onTapGesture = onTapGesture
            self.icon = icon
        }
    }
    
    private func commonInit() {
        backgroundColor = UIColor.white
        layoutMargins = UIEdgeInsets.allSides(Spacing.small)
        
        self.addSubview(titleLabel)
        self.addSubview(iconImageView)
        
        titleLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leftRTL.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints{
            $0.height.width.equalTo(16)
            $0.centerY.equalToSuperview()
            $0.rightRTL.equalToSuperview()
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapAction))
        addGestureRecognizer(tapGesture)
    }
    
    @objc private func viewTapAction() {
        onTapGesture?()
    }
    
    private func updateAppearance() {
        if (isSelected || isHighlighted) && isEnabled {
            UIView.animate(withDuration: 0.15) {
                self.titleLabel.backgroundColor = self.highlightedBackgroundColor
                self.iconImageView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            }
        } else {
            UIView.animate(withDuration: 0.15) {
                self.titleLabel.backgroundColor = UIColor.white
                self.iconImageView.transform = CGAffineTransform.identity
            }
        }
        
        alpha = isEnabled ? 1 : 0.3
    }
}


