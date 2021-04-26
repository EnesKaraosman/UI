//
//  UIStackView+Extensions.swift
//
//
//  Created by Enes Karaosman on 30.12.2020.
//

import UIKit

public extension UIStackView {
    /// UIStackView().horizontal(spacing: amount)
    @discardableResult
    func horizontal(spacing: CGFloat = 0) -> Self {
        with {
            $0.distribution = .fill
            $0.axis = .horizontal
            $0.spacing = spacing
        }
    }
    
    /// UIStackView().vertical(spacing: amount)
    @discardableResult
    func vertical(spacing: CGFloat = 0) -> Self {
        with {
            $0.distribution = .fill
            $0.axis = .vertical
            $0.spacing = spacing
        }
    }
    
    /// UIStackView().distribution(.fillEqually)
    @discardableResult
    func distribution(_ distribution: UIStackView.Distribution = .fillProportionally) -> Self {
        with {
            $0.distribution = distribution
        }
    }
    
    /// UIStackView().alignment(.center)
    @discardableResult
    func alignment(_ alignment: UIStackView.Alignment = .center) -> Self {
        with {
            $0.alignment = alignment
        }
    }
    
    /// UIStackView().vertical(spacing: amount).views(...)
    @discardableResult
    func views(_ views: UIView ...) -> Self {
        views.forEach { self.addArrangedSubview($0) }
        return self
    }
    
    /// UIStackView().vertical(spacing: amount).views { }
    @discardableResult
    func views(@UIViewBuilder _ builder: () -> [UIView]) -> Self {
        builder().forEach { self.addArrangedSubview($0) }
        return self
    }
}
