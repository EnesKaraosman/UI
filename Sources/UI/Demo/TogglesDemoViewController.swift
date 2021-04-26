//
//  TogglesDemoViewController.swift
//  
//
//  Created by Enes Karaosman on 11.01.2021.
//

import UIKit
import AloeStackView

internal final class TogglesDemoViewController: AloeStackViewController {
    
    private var toggleIcon: UIImage? {
        if #available(iOS 13.0, *) {
            return UIImage(systemName: "bell")
        } else {
            return nil
        }
    }
    
    lazy var toggleWithIcon = ComponentFactory.Toggles.createToggle(
        "Toggle with icon",
        icon: toggleIcon
    ).with {
        $0.valueChanged = { state in
            print("Toggle state: \(state)")
        }
    }
    
    lazy var toggleWithoutIcon = ComponentFactory.Toggles.createToggle(
        "Toggle without icon"
    ).with {
        $0.valueChanged = { state in
            print("Toggle state: \(state)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.addRows([
            toggleWithIcon,
            toggleWithoutIcon
        ])
        
    }
    
}
