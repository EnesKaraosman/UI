//
//  SegmentedPicker+Components.swift
//  
//
//  Created by Enes Karaosman on 10.01.2021.
//

import UIKit

public extension ComponentFactory.SegmentedPickers {
    
    static func createSegmentedPicker(with items: [Any]) -> SegmentedPicker {
        SegmentedPicker(items: items).with {
            if #available(iOS 13.0, *) {
                $0.selectedSegmentTintColor = .white
            }
            $0.backgroundColor = UIColor.Secondary.lightOrange
            $0.selectedSegmentIndex = 0
            $0.tintColor = .clear
            $0.defaultConfiguration(font: .init(.rubik, .custom(16), .regular), color: UIColor.Basic.black)
            $0.selectedConfiguration(font: .init(.rubik, .custom(16), .regular), color: UIColor.Basic.orange)
        }
    }
    
}
