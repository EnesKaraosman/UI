//
//  SnapKit+Extensions.swift
//  
//
//  Created by Enes Karaosman on 10.02.2021.
//

import UIKit
import SnapKit

public extension ConstraintMaker {
    
    var leftRTL: ConstraintMakerExtendable {
        !UIView.isRightToLeft() ? self.left : self.right
    }
    
    var rightRTL: ConstraintMakerExtendable {
        !UIView.isRightToLeft() ? self.right : self.left
    }
    
}

public extension ConstraintViewDSL {
    
    var leftRTL: ConstraintItem {
        !UIView.isRightToLeft() ? self.left : self.right
    }
    
    var rightRTL: ConstraintItem {
        !UIView.isRightToLeft() ? self.right : self.left
    }
    
}
