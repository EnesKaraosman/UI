//
//  ButtonsDemoViewController.swift
//  
//
//  Created by Enes Karaosman on 11.01.2021.
//

import UIKit
import AloeStackView

internal final class ButtonsDemoViewController: AloeStackViewController {
    
    lazy var tinyButton = Button("Tiny CTA").tiny()
        .pushToLeft()
    
    lazy var smallButton = Button("Small CTA").small()
        .pushToLeft()
    
    lazy var mediumButton = Button("Medium CTA").medium()
        .pushToLeft()
    
    lazy var longButton = LongButton("This is a long CTA")
    
    lazy var leftAlignedIconButton = LeftAlignedIconButton("LeftAlignedIconButton")
        .small()
        .with {
            $0.setImage(systemIcon("hand.point.left.fill"), for: .normal)
            $0.setTitleColor(.white, for: .normal)
        }
    
    lazy var rightAlignedIconButton = RightAlignedIconButton("RightAlignedIconButton")
        .small()
        .with {
            $0.setImage(systemIcon("hand.point.right.fill"), for: .normal)
            $0.setTitleColor(.white, for: .normal)
        }
    
    lazy var disclosureButton = ComponentFactory.Buttons.createDisclosureButton(
        "Disclosure Button", icon: systemIcon()
    )
    
    lazy var circleButton = CircleButton(icon: systemIcon())
        .pushToLeft()
        .addHeader(Label("CircleButton").header())
    
    lazy var roundedButton = RoundedButton(icon: systemIcon())
        .pushToRight()
        .addHeader(Label("RoundedButton").header().pushToRight())
        
    lazy var roundedCorneredButton = RoundedButton(
        icon: systemIcon(),
        corners: [.topRight, .bottomRight],
        cornerRadius: 28
    )
    .pushToLeft()
    .addHeader(Label("RoundedButton(corners: [.topRight, .bottomRight])").header())
    
    lazy var roundedCorneredButton2 = RoundedButton(
        icon: systemIcon(),
        corners: [.topLeft, .bottomLeft],
        cornerRadius: 28
    )
    .pushToLeft()
    .addHeader(Label("RoundedButton(corners: [.topLeft, .bottomLeft])").header())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.addRows([
            tinyButton,
            smallButton,
            mediumButton,
            longButton,
            leftAlignedIconButton,
            rightAlignedIconButton,
            disclosureButton,
            UIStackView().horizontal().views(circleButton, UIView.spacer, roundedButton),
            roundedCorneredButton,
            roundedCorneredButton2
        ])
        
    }
}
