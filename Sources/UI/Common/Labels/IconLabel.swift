//
//  IconLabel.swift
//  
//
//  Created by Enes Karaosman on 9.01.2021.
//

import UIKit
import SnapKit

final public class IconLabel: UI.View {
    
    public var icon: UIImage? = nil {
        didSet {
            iconImageView.image = icon
        }
    }
    
    public var containerBackgroundColor: UIColor = .clear {
        didSet {
            container.backgroundColor = containerBackgroundColor
        }
    }
    
    public var cornerRadius: CGFloat = 16 {
        didSet {
            container.layer.cornerRadius = cornerRadius
            container.layer.masksToBounds = true
        }
    }
    
    public lazy var iconImageView = UIImageView().scaleAspectFit()
    
    public lazy var label = Label("Label").with {
        $0.font = .init(.rubik, .custom(16), .regular)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private lazy var container = View().subViews(stackViewContainer)
    
    private lazy var stackViewContainer = UIStackView()
        .horizontal(spacing: itemSpacing)
    
    public enum IconPlace {
        case left(UIImage?)
        case right(UIImage?)
        
        var image: UIImage? {
            switch self {
            case .left(let image): return image
            case .right(let image): return image
            }
        }
    }
    
    private var iconPlace: IconPlace = .left(nil) {
        didSet {
            if case IconPlace.left = iconPlace {
                icon = iconPlace.image
                _ = stackViewContainer.views(iconImageView, label)
            } else {
                icon = iconPlace.image
                _ = stackViewContainer.views(label, iconImageView)
            }
        }
    }
    
    private let horizontalSpacing: CGFloat
    private let verticalSpacing: CGFloat
    private let itemSpacing: CGFloat
    
    public init(
        icon: IconPlace,
        horizontalSpacing: CGFloat = 16,
        verticalSpacing: CGFloat = 16,
        itemSpacing: CGFloat = 4
    ) {
        defer {
            self.iconPlace = icon
        }
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
        self.itemSpacing = itemSpacing
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Use proper initializer")
    }
    
    public override func commonInit() {
        super.commonInit()
        
        addSubview(container)
        container.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        stackViewContainer.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview().inset(horizontalSpacing)
            $0.height.equalToSuperview().inset(verticalSpacing)
        }
        
        iconImageView.image = icon
        container.backgroundColor = containerBackgroundColor
        
    }
    
}
