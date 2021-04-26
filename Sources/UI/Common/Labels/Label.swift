//
//  Label.swift
//  
//
//  Created by Enes Karaosman on 28.12.2020.
//

import UIKit

open class Label: UILabel {
    
    static var title = Label().with { $0.font = .title }
    static var body = Label().with { $0.font = .body }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    public init(_ text: String) {
        super.init(frame: .zero)
        self.text = text
        commonInit()
    }
    
    open func commonInit() {
        font = .body
    }
    
    @discardableResult
    public func textColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
}

// MARK: - Label Extensions
public extension Label {
    
    // MARK: - Page Title Typography
    
    /// Heading 40 (Rubik)
    @discardableResult
    func heading40(_ fontWeight: FontWeight = .regular) -> Self {
        with {
            $0.font = .init(.rubik, .custom(40), fontWeight)
            $0.textColor = .gray2
        }
    }
    
    /// Heading 60 (Rubik)
    @discardableResult
    func heading60(_ fontWeight: FontWeight = .regular) -> Self {
        with {
            $0.font = .init(.rubik, .custom(60), fontWeight)
            $0.textColor = .gray2
        }
    }
    
    /// Page Title 32 (Source Serif Pro)
    @discardableResult
    func pageTitle32(_ fontWeight: FontWeight = .semiBold) -> Self {
        with {
            $0.font = .init(.sourceSerifPro, .custom(32), fontWeight)
            $0.textColor = UIColor.Basic.black
        }
    }
    
    /// Page Title 20 (Source Serif Pro)
    @discardableResult
    func pageTitle20(_ fontWeight: FontWeight = .semiBold) -> Self {
        with {
            $0.font = .init(.sourceSerifPro, .custom(20), fontWeight)
            $0.textColor = UIColor.Basic.black
        }
    }
    
    // MARK: - Heading Typography
    
    /// Heading 32 (Rubik)
    @discardableResult
    func heading32(_ fontWeight: FontWeight = .medium) -> Self {
        with {
            $0.font = .init(.rubik, .custom(32), fontWeight)
            $0.textColor = UIColor.Basic.black
        }
    }
    
    /// Heading 24 (Rubik)
    @discardableResult
    func heading24(_ fontWeight: FontWeight = .medium) -> Self {
        with {
            $0.font = .init(.rubik, .custom(24), fontWeight)
            $0.textColor = UIColor.Basic.black
        }
    }
    
    /// Heading 20 (Rubik)
    @discardableResult
    func heading20(_ fontWeight: FontWeight = .medium) -> Self {
        with {
            $0.font = .init(.rubik, .custom(20), fontWeight)
            $0.textColor = UIColor.Basic.black
        }
    }
    
    /// Heading 18 (Rubik)
    @discardableResult
    func heading18(_ fontWeight: FontWeight = .medium) -> Self {
        with {
            $0.font = .init(.rubik, .custom(18), fontWeight)
            $0.textColor = UIColor.Basic.black
        }
    }
    
    /// Heading 16 (Rubik)
    @discardableResult
    func heading16(_ fontWeight: FontWeight = .medium) -> Self {
        with {
            $0.font = .init(.rubik, .custom(16), fontWeight)
            $0.textColor = UIColor.Basic.black
        }
    }
    
    // MARK: - Body Typography
    
    /// Body 15 (Rubik)
    @discardableResult
    func body15(_ fontWeight: FontWeight = .medium) -> Self {
        with {
            $0.font = .init(.rubik, .custom(15), fontWeight)
            $0.textColor = UIColor.Basic.black
        }
    }
    
    /// Body 14 (Rubik)
    @discardableResult
    func body14(_ fontWeight: FontWeight = .medium) -> Self {
        with {
            $0.font = .init(.rubik, .custom(14), fontWeight)
            $0.textColor = UIColor.Basic.black
        }
    }
    
    /// Body 12 (Rubik)
    @discardableResult
    func body12(_ fontWeight: FontWeight = .medium) -> Self {
        with {
            $0.font = .init(.rubik, .custom(12), fontWeight)
            $0.textColor = UIColor.Basic.black
        }
    }
    
    /// Body 10 (Rubik)
    @discardableResult
    func body10(_ fontWeight: FontWeight = .medium) -> Self {
        with {
            $0.font = .init(.rubik, .custom(10), fontWeight)
            $0.textColor = UIColor.Basic.black
        }
    }
    
    /// Body 8 (Rubik)
    @discardableResult
    func body8(_ fontWeight: FontWeight = .medium) -> Self {
        with {
            $0.font = .init(.rubik, .custom(8), fontWeight)
            $0.textColor = UIColor.Basic.black
        }
    }
    
    /// Makes label multiline byWordWrapping
    @discardableResult
    func makeMultiline(_ numberOfLines: Int = 0) -> Self {
        with {
            $0.numberOfLines = numberOfLines
            $0.lineBreakMode = .byWordWrapping
        }
    }
    
    @discardableResult
    func minimumScaleFactor(_ value: CGFloat) -> Self {
        with {
            $0.adjustsFontSizeToFitWidth = true
            $0.minimumScaleFactor = value
        }
    }
    
}
