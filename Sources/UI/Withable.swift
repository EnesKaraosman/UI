//
//  Withable.swift
//  
//
//  Created by Enes Karaosman on 30.12.2020.
//

import Foundation

/**
    Usage
 
 UIButton().configure { }
 UILabel().configure { }
 ..
 */

public protocol Withable {
    associatedtype T
    @discardableResult func with(_ closure: (_ instance: T) -> Void) -> T
}

public extension Withable {
    @discardableResult func with(_ closure: (_ instance: Self) -> Void) -> Self {
        closure(self)
        return self
    }
}

extension NSObject: Withable { }
