//
//  NavigationHeadersDemoController.swift
//  
//
//  Created by Enes Karaosman on 27.02.2021.
//

import UIKit
import AloeStackView

internal final class NavigationHeadersDemoController: AloeStackViewController {
 
    private lazy var plainHeader = ComponentFactory.NavigationHeaders.PlainHeader()
        .with {
            $0.title.text = "Navigation Plain Header"
        }
        .addHeader(Label("PlainHeader").header().pushToLeft())
    
    private lazy var gradientRightSideImageHeader = HeaderRadialGradientRightSideImage()
        .addHeader(Label("HeaderRadialGradientRightSideImage").header().pushToLeft())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.addRows([
            plainHeader,
            gradientRightSideImageHeader
        ])
        
        stackView.setInset(forRows: [
            plainHeader,
            gradientRightSideImageHeader
        ], inset: .vertical(16))
    }
    
    
}

