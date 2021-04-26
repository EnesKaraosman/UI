//
//  UIView+Extensions.swift
//
//
//  Created by Enes Karaosman on 30.12.2020.
//

import UIKit
import LBTATools

public protocol UIKitView {
    var view: UIView { get }
}

extension UIView: UIKitView {
    public var view: UIView { self }
}

@_functionBuilder
public struct UIViewBuilder {
    public static func buildBlock(_ views: UIKitView...) -> [UIView] {
        views.map { $0.view }
    }
}

public extension UIView {
    
    static func isRightToLeft() -> Bool {
        UIView.appearance().semanticContentAttribute == .forceRightToLeft
    }
    
    static var spacer: UIView {
        UIView().with {
            $0.setContentHuggingPriority(.required, for: .horizontal)
            $0.setContentHuggingPriority(.required, for: .vertical)
        }
    }
    
    static func divider(color: UIColor = UIColor(hex: "#E0E0E0")) -> UIView {
        UIView().with {
            $0.withHeight(1)
            $0.backgroundColor = color
        }
    }
    
    var withRedLines: Self {
        with {
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 2
            $0.layer.borderColor = UIColor.red.withAlphaComponent(0.3).cgColor
            $0.backgroundColor = UIColor.red.withAlphaComponent(0.1)
        }
    }
    
    /// Debug purposes
    var inspect: Self {
        withRedLines
    }
    
    /// Embeds view in UIStackView and pushes to the top.
    func pushToTop() -> UIStackView {
        UIStackView().vertical(spacing: 16)
            .distribution(.fill)
            .views(self, UIView.spacer)
    }
    
    /// Embeds view in UIStackView and pushes to the bottom.
    func pushToBottom() -> UIStackView {
        UIStackView().vertical(spacing: 16)
            .distribution(.fill)
            .views(UIView.spacer, self)
    }
    
    /// Embeds view in UIStackView and pushes to the left.
    func pushToLeft() -> UIStackView {
        UIStackView().horizontal(spacing: 16)
            .distribution(.fill)
            .views(self, UIView.spacer)
    }
    
    /// Embeds view in UIStackView and pushes to the right.
    func pushToRight() -> UIStackView {
        UIStackView().horizontal(spacing: 16)
            .distribution(.fill)
            .views(UIView.spacer, self)
    }
    
    /// Adds Subviews recursively
    /// - Parameter views: Views to be added.
    @discardableResult
    func subViews(_ views: UIView ...) -> Self {
        views.forEach { addSubview($0) }
        return self
    }
    
    /// Adds Subviews recursively
    /// - Parameter views: Views to be added.
    @discardableResult
    func subViews(@UIViewBuilder _ builder: () -> [UIView]) -> Self {
        builder().forEach { addSubview($0) }
        return self
    }
    
    /// Embed a View to all anchors (top, bottom, leading, trailing)
    /// - Parameters:
    ///     - withPadding: The amount of space between the embedded view and this view
    ///     - closure: A trailing closure that accepts a view
    @discardableResult
    func embed(
        withInsets insets: UIEdgeInsets = .zero,
        _ closure: () -> UIView
    ) -> Self {
        let viewToEmbed = closure()
        viewToEmbed.translatesAutoresizingMaskIntoConstraints = false
        addSubview(viewToEmbed)
        
        NSLayoutConstraint.activate([
            viewToEmbed.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(insets.top)),
            viewToEmbed.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat(-insets.bottom)),
            viewToEmbed.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(insets.left)),
            viewToEmbed.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat(-insets.right))
        ])
        
        return self
    }
    
    /// Embed a View to all anchors (top, bottom, leading, trailing)
    /// - Parameters:
    ///     - withPadding: The amount of space between the embedded view and this view
    ///     - closure: A trailing closure that accepts a view
    @discardableResult
    func embedInSafeArea(
        withInsets insets: UIEdgeInsets = .zero,
        _ closure: () -> UIView
    ) -> Self {
        
        self.embed(withInsets: insets) {
            SafeAreaView(closure)
        }
        
        return self
    }
    
    /// Inserts given subview above itself
    /// - Parameter view: View to be added above.
    @discardableResult
    func addAbove(_ view: UIView, centerInSuperview: Bool = true) -> UIView {
        insertSubview(view, aboveSubview: self)
        if centerInSuperview { view.centerInSuperview() }
        return self
    }
    
    enum RectCorner: Int {
        case bottomRight = 0,
             topRight,
             bottomLeft,
             topLeft
    }
    
    private func parseCorner(corner: RectCorner) -> CACornerMask.Element {
        let corners: [CACornerMask.Element] = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        return corners[corner.rawValue]
    }
    
    private func createMask(corners: [RectCorner]) -> UInt {
        return corners.reduce(0, { (a, b) -> UInt in
            return a + parseCorner(corner: b).rawValue
        })
    }
    
    /// Usage: View().roundCorners([.topLeft, .bottomLeft], cornerRadius: 8)
    func roundCorners(corners: [RectCorner], cornerRadius: CGFloat = 8) {
        layer.cornerRadius = cornerRadius
        let maskedCorners: CACornerMask = CACornerMask(rawValue: createMask(corners: corners))
        layer.maskedCorners = maskedCorners
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat, rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}
