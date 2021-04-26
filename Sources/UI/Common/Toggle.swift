//
//  Toggle.swift
//  
//
//  Created by Enes Karaosman on 1.01.2021.
//

import UIKit
import SnapKit

open class Toggle: View {
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 44)
    }
    
    public var valueChanged: ((Bool) -> Void)?
    public var text: String? {
        didSet {
            titleLabel.text = text
        }
    }
    public var icon: UIImage? {
        didSet {
            iconImageView.image = icon
            iconImageView.isHidden = icon == nil
            super.setNeedsLayout()
        }
    }
    
    public lazy var toggle = Switch()
    public lazy var titleLabel = Label(text ?? "")
        .heading16(.regular)
    
    public lazy var iconImageView = UIImageView()
        .scaleAspectFit()
        .with(image: icon)
        .with {
            $0.tintColor = UIColor.Basic.teal
        }
    
    private var iconWidth: CGFloat = 20
    private var spacing: CGFloat = 15
    private lazy var container = UIStackView()
        .horizontal(spacing: spacing)
        .distribution(.fill)
        .views {
            iconImageView
            titleLabel
            UIView.spacer
            toggle
        }
    
    public init(
        _ text: String,
        icon: UIImage? = nil,
        iconWidth: CGFloat = 24,
        spacing: CGFloat = 15
    ) {
        defer {
            self.text = text
            self.icon = icon
        }
        self.iconWidth = iconWidth
        self.spacing = spacing
        super.init(frame: .zero)
        commonInit()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    open override func commonInit() {
        addSubview(container)
        container.snp.makeConstraints { $0.edges.equalToSuperview() }
        toggle.addTarget(self, action: #selector(toggleValueChanged), for: .valueChanged)
        iconImageView.snp.makeConstraints {
            $0.width.equalTo(iconWidth)
        }
        toggle.snp.makeConstraints {
            $0.width.equalTo(37)
            $0.height.equalTo(20)
        }
    }
    
    @objc private func toggleValueChanged() {
        valueChanged?(toggle.isOn)
    }
    
}
