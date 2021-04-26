//
//  CircleView.swift
//  
//
//  Created by Enes Karaosman on 23.01.2021.
//

import Foundation

open class CircleView: View {
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
    }
    
}
