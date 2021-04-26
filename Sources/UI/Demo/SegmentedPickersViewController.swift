//
//  SegmentedPickersViewController.swift
//  
//
//  Created by Enes Karaosman on 11.01.2021.
//

import UIKit
import AloeStackView

internal class SegmentedPickersDemoViewController: AloeStackViewController {
    
    lazy var segmentedPicker = ComponentFactory.SegmentedPickers.createSegmentedPicker(with: ["Cards", "List"])
        .with {
            $0.onValueChanged = { index in
                print(index)
            }
        }
        .addHeader(Label("Segmented Picker").header())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.addRows([
            segmentedPicker
        ])
        
    }
    
}
