//
//  UIEdgeInsets+Extensions.swift
//  
//
//  Created by Enes Karaosman on 12.01.2021.
//

import UIKit

public extension UIEdgeInsets {
    
    static func vertical(_ amount: CGFloat) -> UIEdgeInsets {
        .init(top: amount, left: 0, bottom: amount, right: 0)
    }
    
    static func horizontal(_ amount: CGFloat) -> UIEdgeInsets {
        .init(top: 0, left: amount, bottom: 0, right: amount)
    }
    
    static func allEdges(_ amount: CGFloat) -> UIEdgeInsets {
        .init(top: amount, left: amount, bottom: amount, right: amount)
    }
    
    /// 8 point from all sides
    static var allEdges8 = allEdges(8)
    
    /// 16 point from all sides
    static var allEdges16 = allEdges(16)
    
}
