//
//  View.swift
//  
//
//  Created by Enes Karaosman on 30.12.2020.
//

import UIKit

open class View: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    open func commonInit() {
        
    }
    
}
