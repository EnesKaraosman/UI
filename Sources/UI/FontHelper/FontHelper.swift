//
//  FontHelper.swift
//  
//
//  Created by Enes Karaosman on 1.01.2021.
//

import UIKit

/// To access from outside of the module.
fileprivate let fontBundle  = Bundle.module

/// Registers fonts defined  in `FontFamily` enum.
public func registerFonts() {
    
    let fontFamilies = FontFamily.allCases.filter { FontFamily.fallback != $0 }
    fontFamilies.map(\.rawValue).forEach { fontName in
        FontWeight.allCases.forEach { weight in
            let fontLongName = "\(fontName)-\(weight.rawValue)"
            _ = UIFont.registerFont(bundle: .module, fontName: fontLongName, fontExtension: "ttf")
        }
    }
}

extension UIFont {
    static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) -> Bool {

        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension) else {
            print("Couldn't find font \(fontName)")
            return false
        }
        
        print("The font url is: \(fontURL)")

        guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL) else {
            fatalError("Couldn't load data from the font \(fontName)")
        }

        guard let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }

        var error: Unmanaged<CFError>?
        let success = CTFontManagerRegisterGraphicsFont(font, &error)
        guard success else {
            print("Error registering font: maybe it was already registered.")
            return false
        }

        return true
    }
}

public enum FontFamily: String, Codable, CaseIterable, Comparable {

    case nunito   = "Nunito"
    case rubik  = "Rubik"
    case bahijUthman = "BahijUthmanTaha"
    case sourceSerifPro = "SourceSerifPro"
    case fallback = "Menlo" // System font for fallback

    public static var onlySystemFonts: [String] {
        return UIFont.familyNames
    }
    
    public static var defaultFamily: FontFamily = .fallback
    
    public static func < (lhs: FontFamily, rhs: FontFamily) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
}

public enum FontWeight: String, CaseIterable {
    case black            = "Black"
    case blackItalic      = "BlackItalic"
    case bold             = "Bold"
    case boldItalic       = "BoldItalic"
    case extraBold        = "ExtraBold"
    case extraBoldItalic  = "ExtraBoldItalic"
    case extraLight       = "ExtraLight"
    case extraLightItalic = "ExtraLightItalic"
    case italic           = "Italic"
    case light            = "Light"
    case lightItalic      = "LightItalic"
    case medium           = "Medium"
    case mediumItalic     = "MediumItalic"
    case regular          = "Regular"
    case semiBold         = "SemiBold"
    case semiBoldItalic   = "SemiBoldItalic"
}

public enum FontSize {
    
    /// Large Title - 34
    case titleLarge
    
    /// Title1 - 28
    case title1
    
    /// Title2 - 22
    case title2
    
    /// Title3 - 20
    case title3
    
    /// Body - 17
    case body
    
    /// Subhead - 15
    case subhead
    
    /// Footnote - 13
    case footnote
    
    /// Caption - 12
    case caption1
    
    /// Caption - 11
    case caption2
    
    /// Custom
    case custom(CGFloat)
    
    var value: CGFloat {
        switch self {
        case .titleLarge:       return 34
        case .title1:           return 28
        case .title2:           return 22
        case .title3:           return 20
        case .body:             return 17
        case .subhead:          return 15
        case .footnote:         return 13
        case .caption1:         return 12
        case .caption2:         return 11
        case .custom(let size): return size
        }
    }
}

// Provides you the option to fallback incompatible Font Family and Weight.
private func stringName(_ family: FontFamily, _ weight: FontWeight) -> String {
    let fontWeight: String
    switch (family, weight) {
    // Below does not exist.
    case (.rubik, .extraLight), (.rubik, .extraLightItalic):
        fontWeight = FontWeight.regular.rawValue
    default:
        fontWeight = weight.rawValue
    }
    let familyName = family.rawValue
    return fontWeight.isEmpty ? "\(familyName)" : "\(familyName)-\(fontWeight)"
}

// For SwiftUI extend Font
public extension UIFont {
    
    static let title: UIFont = .init(.title1, .bold)
    static let body: UIFont  = .init(.body, .regular)

    convenience init(_ size: FontSize, _ weight: FontWeight) {
        self.init(.defaultFamily, size, weight)
    }
    
    convenience init(_ family: FontFamily = .defaultFamily,
                     _ size: FontSize, _ weight: FontWeight) {
        
        let fontName = stringName(family, weight)
        if !checkFontExist(name: fontName) {
            self.init(name: FontFamily.fallback.rawValue, size: size.value)!
            return
        }
        self.init(name: fontName, size: size.value)!
    }
    
}

fileprivate func checkFontExist(name: String) -> Bool {

    guard let _ = fontBundle.path(forResource: name, ofType: "ttf") else {
        print("‼️ \(name) Font is not added to bundle, if exist make sure you call registerFonts() method")
        return false
    }
    
    return true
}

/**
 Usage;
 
 let label = UILabel()
 label.font = .init(.body, .bold) // Or define static extensions to set as label.font = .title

 */

/**
 https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/typography/
 Human Interface guidelines
 
 Style              Weight    Size (Points)    Leading (Points)
 Large Title        Regular         34                41
 Title 1            Regular         28                34
 Title 2            Regular         22                28
 Title 3            Regular         20                25
 Headline           Semi-Bold       17                22
 Body               Regular         17                22
 Callout            Regular         16                21
 Subhead            Regular         15                20
 Footnote           Regular         13                18
 Caption 1          Regular         12                16
 Caption 2          Regular         11                13
 */
