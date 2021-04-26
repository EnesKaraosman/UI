//
//  SafeAreaView.swift
//  
//
//  Created by Enes Karaosman on 12.02.2021.
//

import UIKit

// https://github.com/0xLeif/SwiftUIKit/blob/master/Sources/SwiftUIKit/Containers/SafeAreaView.swift

/// A View that respects the SafeArea (Top & Bottom edges)
public class SafeAreaView: UIView {
    
    /// Create a SafeAreaView
    /// - Parameters:
    ///     - closure: A trailing closure that accepts a view
    public init(_ closure: () -> UIView) {
        let view = closure()
        super.init(frame: .zero)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        let guide = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            view.leftAnchor.constraint(equalTo: guide.leftAnchor),
            view.rightAnchor.constraint(equalTo: guide.rightAnchor),
            view.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
            guide.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 1.0)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
