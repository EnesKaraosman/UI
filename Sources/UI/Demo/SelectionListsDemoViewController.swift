//
//  SelectionListsDemoViewController.swift
//  
//
//  Created by Enes Karaosman on 11.01.2021.
//

import UIKit
import AloeStackView

internal final class SelectionListsDemoViewController: AloeStackViewController {
    
    lazy var singleSelection = ComponentFactory.SelectionLists.createSelectionList()
        .single()
        .with {
            $0.items = ["One", "Two"]
            if #available(iOS 13.0, *) {
                $0.selectionImage = UIImage(systemName: "largecircle.fill.circle")
                $0.deselectionImage = UIImage(systemName: "circle")
            }
        }
        .addHeader(Label("Single Selection").header())
    
    lazy var multipleSelection = ComponentFactory.SelectionLists.createSelectionList()
        .multiple()
        .with {
            $0.items = ["One", "Two"]
            if #available(iOS 13.0, *) {
                $0.selectionImage = UIImage(systemName: "checkmark.square.fill")
                $0.deselectionImage = UIImage(systemName: "square")
            }
        }
        .addHeader(Label("Multiple Selection").header())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.addRows([
            singleSelection,
            multipleSelection
        ])
        
    }
    
}
