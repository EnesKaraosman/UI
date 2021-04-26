//
//  Toggle+Components.swift
//  
//
//  Created by Enes Karaosman on 10.01.2021.
//

import UIKit

public extension ComponentFactory.Toggles {
    static func createToggle(_ title: String, icon: UIImage? = nil) -> Toggle {
        Toggle(title, icon: icon)
    }
}
