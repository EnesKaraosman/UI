//
//  Reusable.swift
//  
//
//  Created by Enes Karaosman on 9.02.2021.
//

import UIKit

public protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}

extension UICollectionViewCell: ReusableView { }
extension UITableViewCell: ReusableView { }
extension UICollectionReusableView: ReusableView { }
