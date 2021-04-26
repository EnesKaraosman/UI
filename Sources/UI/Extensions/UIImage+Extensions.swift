//
//  UIImage+Extensions.swift
//  
//
//  Created by Enes Karaosman on 7.01.2021.
//

import UIKit

public extension UIImage {
    
    static func withColor(
        _ color: UIColor,
        imageSize: CGSize = CGSize(width: 1, height: 1),
        colorSize: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)
    ) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
        color.setFill()
        UIRectFill(colorSize)
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func colorImage(with color: UIColor) -> UIImage? {
            guard let cgImage = self.cgImage else { return nil }
            UIGraphicsBeginImageContext(self.size)
            let contextRef = UIGraphicsGetCurrentContext()

            contextRef?.translateBy(x: 0, y: self.size.height)
            contextRef?.scaleBy(x: 1.0, y: -1.0)
            let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)

            contextRef?.setBlendMode(CGBlendMode.normal)
            contextRef?.draw(cgImage, in: rect)
            contextRef?.setBlendMode(CGBlendMode.sourceIn)
            color.setFill()
            contextRef?.fill(rect)

            let coloredImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return coloredImage
        }
    
}
