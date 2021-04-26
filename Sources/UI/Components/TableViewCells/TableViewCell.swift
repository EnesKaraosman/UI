//
//  TableViewCell.swift
//  
//
//  Created by Enes Karaosman on 14.02.2021.
//

import UIKit

open class TableViewCell<Item>: UITableViewCell {
    
    open var item: Item!
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    open func commonInit() {
        
    }
    
}
