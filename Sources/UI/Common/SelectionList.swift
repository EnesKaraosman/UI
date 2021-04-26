//
//  SelectionList.swift
//  
//
//  Created by Enes Karaosman on 12.01.2021.
//

import UIKit
import SelectionList

public extension SelectionList {
    
    func single() -> Self {
        with {
            $0.isSelectionMarkTrailing = false
            $0.tableView.separatorStyle = .none
            $0.allowsMultipleSelection = false
            $0.setupCell = { (cell: UITableViewCell, index: Int) in
                cell.textLabel?.font = .init(.nunito, .custom(18), .semiBold)
            }
        }
    }
    
    func multiple() -> Self {
        with {
            $0.isSelectionMarkTrailing = false
            $0.tableView.separatorStyle = .none
            $0.allowsMultipleSelection = true
            $0.setupCell = { (cell: UITableViewCell, index: Int) in
                cell.textLabel?.font = .init(.nunito, .custom(18), .semiBold)
            }
        }
    }
    
}
