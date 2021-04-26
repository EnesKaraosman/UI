//
//  ProgressViewsDemoViewController.swift
//  
//
//  Created by Enes Karaosman on 11.01.2021.
//

import UIKit
import AloeStackView
import SnapKit

internal class ProgressViewsDemoViewController: AloeStackViewController {
    
    lazy var linearProgressView = LinearProgressView()
        .with {
            $0.barColor = UIColor.black.withAlphaComponent(0.15)
            $0.trackColor = UIColor(hex: "#343943")
            $0.setProgress(53, animated: true)
            $0.barInset = 2
        }
        .addHeader(Label("Linear Progress View").header())
        .withHeight(42)
    
    lazy var stepper25 = StepperProgressView()
        .with { $0.value = 25 }
        .withHeight(10)
    
    lazy var stepper50 = StepperProgressView()
        .with { $0.value = 50 }
        .withHeight(10)
    
    lazy var stepper75 = StepperProgressView()
        .with { $0.value = 70 }
        .withHeight(10)
    
    lazy var stepper100 = StepperProgressView()
        .with { $0.value = 100 }
        .withHeight(10)
    
    lazy var stepperStack = UIStackView().vertical(spacing: 16)
        .views(stepper25, stepper50, stepper75, stepper100)
        .withWidth(120)
        .pushToLeft()
        .addHeader(Label("Stepper Progress View").header())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.addRows([
            linearProgressView,
            stepperStack
        ])
    }
    
}
