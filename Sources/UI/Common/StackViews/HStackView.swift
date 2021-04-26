//
//  HStackView.swift
//  
//
//  Created by Enes Karaosman on 6.02.2021.
//

import UIKit

public class HStackView: UI.StackView {
    
    public init(
        alignment: UIStackView.Alignment = .center,
        spacing: CGFloat = 0,
        @UIViewBuilder _ builder: () -> [UIView]
    ) {
        super.init(frame: .zero)
        self.alignment = alignment
        self.spacing = spacing
        self.axis = .horizontal
        views(builder)
    }
    
    public required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
