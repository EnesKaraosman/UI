//
//  View+Components.swift
//  
//
//  Created by Enes Karaosman on 23.01.2021.
//

import UIKit

public extension ComponentFactory.Views {
    static func createMaskView(icon: UIImage? = nil) -> View {
        View().with {
            $0.backgroundColor = UIColor.gray4.withAlphaComponent(0.4)
            if let icon = icon {
                $0.addAbove(
                    UIImageView(image: icon)
                        .scaleAspectFit()
                        .with {
                            $0.tintColor = UIColor.Basic.white
                            $0.centerInSuperview()
                        }
                )
            }
        }
    }
}
