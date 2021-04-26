//
//  LabelsDemoViewController.swift
//  
//
//  Created by Enes Karaosman on 11.01.2021.
//

import UIKit
import AloeStackView

internal final class LabelsDemoViewController: AloeStackViewController {
    
    lazy var leftIconLabel = IconLabel(icon: .left(systemIcon())).with {
        $0.containerBackgroundColor = .purple
        $0.cornerRadius = 16
    }
    .addHeader(Label("IconLabel(icon: left())").header())
    .alignLeftInStackView()
    
    lazy var rightIconLabel = IconLabel(icon: .right(systemIcon())).with {
        $0.containerBackgroundColor = .purple
        $0.cornerRadius = 16
    }
    .addHeader(Label("IconLabel(icon: .right())").header())
    .alignLeftInStackView()
    
    lazy var pageTitleTypography = Label("Page Title Typography").with {
        $0.minimumScaleFactor = 0.7
        $0.font = .init(.rubik, .custom(35), .regular)
        $0.textColor = UIColor.Basic.orange
    }
    
    lazy var headingTypography = Label("Heading Typography").with {
        $0.font = .init(.rubik, .custom(35), .regular)
        $0.textColor = UIColor.Basic.orange
    }
    
    lazy var bodyTypography = Label("Body Typography").with {
        $0.font = .init(.rubik, .custom(35), .regular)
        $0.textColor = UIColor.Basic.orange
    }
    
    private var spacer: View { View() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.addRows([
            
            pageTitleTypography,
            Label("Page Title / 32 / Semibold").pageTitle32(),
            Label("Page Title / 20 / Semibold").pageTitle20(),
            spacer,
            
            headingTypography,
            Label("Heading / 32 / Bold").heading32(.bold),
            Label("Heading / 32 / Medium").heading32(.medium),
            Label("Heading / 32 / Regular").heading32(.regular),
            spacer,
            Label("Heading / 24 / Bold").heading24(.bold),
            Label("Heading / 24 / Medium").heading24(.medium),
            Label("Heading / 24 / Regular").heading24(.regular),
            spacer,
            Label("Heading / 20 / Bold").heading20(.bold),
            Label("Heading / 20 / Medium").heading20(.medium),
            Label("Heading / 20 / Regular").heading20(.regular),
            spacer,
            Label("Heading / 18 / Bold").heading18(.bold),
            Label("Heading / 18 / Medium").heading18(.medium),
            Label("Heading / 18 / Regular").heading18(.regular),
            spacer,
            Label("Heading / 16 / Bold").heading16(.bold),
            Label("Heading / 16 / Medium").heading16(.medium),
            Label("Heading / 16 / Regular").heading16(.regular),
            
            bodyTypography,
            Label("Body / 15 / Bold").body15(.bold),
            Label("Body / 15 / Medium").body15(.medium),
            Label("Body / 15 / Regular").body15(.regular),
            spacer,
            Label("Body / 14 / Bold").body14(.bold),
            Label("Body / 14 / Medium").body14(.medium),
            Label("Body / 14 / Regular").body14(.regular),
            spacer,
            Label("Body / 12 / Bold").body12(.bold),
            Label("Body / 12 / Medium").body12(.medium),
            Label("Body / 12 / Regular").body12(.regular),
            spacer,
            Label("Body / 10 / Bold").body10(.bold),
            Label("Body / 10 / Medium").body10(.medium),
            Label("Body / 10 / Regular").body10(.regular),
            spacer,
            Label("Body / 8 / Bold").body8(.bold),
            Label("Body / 8 / Medium").body8(.medium),
            Label("Body / 8 / Regular").body8(.regular),
            
            leftIconLabel,
            rightIconLabel
        ])
        
    }
}
