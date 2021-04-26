//
//  Colors.swift
//  
//
//  Created by Enes Karaosman on 3.01.2021.
//

import UIKit

/**
 Usage sample;
 
 let lightModeColor = .black
 let darkModeColor = .white
 let dynamicColor = lightModeColor | darkModeColor
 */

// https://www.avanderlee.com/swift/dark-mode-support-ios/
infix operator |: AdditionPrecedence
public extension UIColor {
    
    /// Easily define two colors for both light and dark mode.
    /// - Parameters:
    ///   - lightMode: The color to use in light mode.
    ///   - darkMode: The color to use in dark mode.
    /// - Returns: A dynamic color that uses both given colors respectively for the given user interface style.
    static func | (lightMode: UIColor, darkMode: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else { return lightMode }
        
        return UIColor { (traitCollection) -> UIColor in
            return traitCollection.userInterfaceStyle == .light ? lightMode : darkMode
        }
    }
}

public extension UIColor {
    
    static let extraGreen = #colorLiteral(red: 0.1865404546, green: 0.7823075652, blue: 0.5647362471, alpha: 1)
    static let extraRed   = #colorLiteral(red: 0.9521295428, green: 0.3749014735, blue: 0.3763326108, alpha: 1)
    
    /// Gray1 is the darkest one.
    static let gray1 = #colorLiteral(red: 0.3411477506, green: 0.3411925435, blue: 0.3411325216, alpha: 1)
    
    static let gray2 = #colorLiteral(red: 0.5097631216, green: 0.5098270178, blue: 0.5097413063, alpha: 1)
    static let gray3 = #colorLiteral(red: 0.7411188483, green: 0.7412089705, blue: 0.7410882115, alpha: 1)
    static let gray4 = #colorLiteral(red: 0.8783639073, green: 0.8784695268, blue: 0.8783279061, alpha: 1)
    
    /// Gray5 is the lightest one.
    static let gray5 = #colorLiteral(red: 0.9489468932, green: 0.9490606189, blue: 0.9489082694, alpha: 1)
    
    struct Basic {
        public static let black       = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        public static let white       = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        public static let orange      = #colorLiteral(red: 0.964019835, green: 0.5429666638, blue: 0.2870778441, alpha: 1)
        public static let teal        = #colorLiteral(red: 0.2318229377, green: 0.7149757743, blue: 0.744517684, alpha: 1)
        public static let brown       = #colorLiteral(red: 0.653467834, green: 0.5621914268, blue: 0.5107989907, alpha: 1)
        public static let background  = #colorLiteral(red: 0.9983932376, green: 0.9840771556, blue: 0.9710164666, alpha: 1)
        public static let blue        = #colorLiteral(red: 0.29153198, green: 0.5642064214, blue: 0.8872771859, alpha: 1)
        public static let purple      = #colorLiteral(red: 0.4186847806, green: 0.3644977808, blue: 0.7496500015, alpha: 1)
    }
    
    struct Pastel {
        public static let lightPink   = #colorLiteral(red: 0.9763960242, green: 0.9068328142, blue: 0.9473508, alpha: 1)
        public static let lightRed    = #colorLiteral(red: 1, green: 0.9271311164, blue: 0.9151334167, alpha: 1)
        public static let lightGreen  = #colorLiteral(red: 0.8842702508, green: 0.9595732093, blue: 0.9362985492, alpha: 1)
        public static let lightPurple = #colorLiteral(red: 0.9521872401, green: 0.9357036352, blue: 1, alpha: 1)
        public static let lightBlue   = #colorLiteral(red: 0.9025099277, green: 0.9661983848, blue: 0.9999346137, alpha: 1)
        public static let lightYellow = #colorLiteral(red: 0.9976568818, green: 0.9824152589, blue: 0.7962588072, alpha: 1)
        public static let darkPink    = #colorLiteral(red: 0.9697768092, green: 0.8133324981, blue: 0.8513541818, alpha: 1)
        public static let darkRed     = #colorLiteral(red: 0.9565317035, green: 0.7203962207, blue: 0.7031068802, alpha: 1)
        public static let darkGreen   = #colorLiteral(red: 0.8143599629, green: 0.9428607821, blue: 0.8174734116, alpha: 1)
        public static let darkPurple  = #colorLiteral(red: 0.8459846377, green: 0.8118039966, blue: 0.973223865, alpha: 1)
        public static let darkBlue    = #colorLiteral(red: 0.7981094718, green: 0.916200757, blue: 0.9838783145, alpha: 1)
        public static let darkYellow  = #colorLiteral(red: 0.9851110578, green: 0.9264458418, blue: 0.6997759938, alpha: 1)
    }

    struct Secondary {
        public static let lightOrange = #colorLiteral(red: 0.9945724607, green: 0.9559296966, blue: 0.9345147014, alpha: 1)
        public static let beige       = #colorLiteral(red: 0.9529064298, green: 0.9289797544, blue: 0.9073113799, alpha: 1)
        public static let lightBlue   = #colorLiteral(red: 0.9289372563, green: 0.9537790418, blue: 0.9532076716, alpha: 1)
        public static let backgroundWhitish = #colorLiteral(red: 1, green: 0.9960995317, blue: 0.9872558713, alpha: 1)
        public static let dimmedOrange = #colorLiteral(red: 0.9764705882, green: 0.6862745098, blue: 0.5058823529, alpha: 1)
    }

}
