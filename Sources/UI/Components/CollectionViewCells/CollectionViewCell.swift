//
//  CollectionViewCell.swift
//  
//
//  Created by Enes Karaosman on 24.01.2021.
//

import UIKit

open class CollectionViewCell<Item>: UICollectionViewCell {
    
    open var item: Item!
    
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
