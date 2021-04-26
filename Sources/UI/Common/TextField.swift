//
//  TextField.swift
//  
//
//  Created by Enes Karaosman on 1.01.2021.
//

import UIKit

open class TextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
//    public init(placeholder: String) {
//        super.init(frame: .zero)
//        self.placeholder = placeholder
//        commonInit()
//    }
    
    open func commonInit() {
        font = .body
    }
    
}
