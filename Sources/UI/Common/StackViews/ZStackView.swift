//
//  ZStackView.swift
//  
//
//  Created by Enes Karaosman on 7.02.2021.
//

import UIKit

    
/// ZStackView:
/// A view which stacks its children views in order
public class ZStackView: UI.View {
    
    public enum Alignment {
        case topLeading
        case topTrailing
        case center
        case topCenter
        case bottomLeading
        case bottomTrailing
    }
    
    /// The views that the ZStack contains
    public var views: [UIView] = []
    
    /// Create a ZStack
    /// - Parameters:
    ///     - alignment: Aligns items according to `ZStack` since it is the superview.
    ///     - builder: A close, collection of views with builder syntax.
    public init(alignment: Alignment = .center, @UIViewBuilder _ builder: () -> [UIView]) {
        views = builder()
        super.init(frame: .zero)
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            switch alignment {
            case .topCenter:
                addSubview($0, anchors: [.top(0), .centerX(0)])
            case .topLeading:
                addSubview($0)
            case .topTrailing:
                addSubview($0, anchors: [.top(0), .trailing(0)])
            case .center:
                addSubview($0, anchors: [.centerX(0), .centerY(0)])
            case .bottomLeading:
                addSubview($0, anchors: [.bottom(0), .leading(0)])
            case .bottomTrailing:
                addSubview($0, anchors: [.bottom(0), .trailing(0)])
            }
            $0.sizeToFit()
        }
    }
    
    
    /// Create a ZStack
    /// - Parameters:
    ///   - alignment: Aligns items according to `ZStack` since it is the superview.
    ///   - closure: A trailing closure that accepts an array of views
    public init(alignment: Alignment = .center, _ views: UIView...) {
        self.views = views
        super.init(frame: .zero)
        self.views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            switch alignment {
            case .topCenter:
                addSubview($0, anchors: [.top(0), .centerX(0)])
            case .topLeading:
                addSubview($0)
            case .topTrailing:
                addSubview($0, anchors: [.top(0), .trailing(0)])
            case .center:
                addSubview($0, anchors: [.centerX(0), .centerY(0)])
            case .bottomLeading:
                addSubview($0, anchors: [.bottom(0), .leading(0)])
            case .bottomTrailing:
                addSubview($0, anchors: [.bottom(0), .trailing(0)])
            }
            $0.sizeToFit()
        }
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
