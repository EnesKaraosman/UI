//
//  File.swift
//  
//
//  Created by Enes Karaosman on 28.03.2021.
//

import UIKit

open class CollectionReusableView<Item>: UICollectionReusableView {

    open var item: Item!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    open func commonInit() { }
}
