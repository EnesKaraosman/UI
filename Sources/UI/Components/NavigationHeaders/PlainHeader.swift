//
//  PlainHeader.swift
//  
//
//  Created by Enes Karaosman on 27.02.2021.
//

import UIKit

public extension ComponentFactory.NavigationHeaders {
    
    final class PlainHeader: UI.View {
        
        public override var intrinsicContentSize: CGSize {
            .init(width: UIView.noIntrinsicMetric, height: 56)
        }
        
        public lazy var title = Label("Navigation Title")
            .pageTitle20(.semiBold)
            .textColor(UIColor.Basic.black)
        
        public lazy var backButton = UI.RoundedButton(
            icon: systemIcon("arrow.backward")?.imageFlippedForRightToLeftLayoutDirection()
        )
        .withWidth(56).withHeight(56)
        .with {
            $0.backgroundColor = .clear
            $0.highlightedBackgroundColor = .clear
            $0.iconImageView.tintColor = UIColor.Basic.black
        }
        
        private lazy var navigationHeaderContainer = UI.View()
            .subViews(backButton, title)
            .withHeight(30)
            .with { $0.backgroundColor = .clear }
        
        public override func commonInit() {
            super.commonInit()
            embed {
                navigationHeaderContainer
            }
            backButton.snp.makeConstraints {
                $0.leftRTL.equalToSuperview()
                $0.centerY.equalToSuperview()
            }
            title.snp.makeConstraints {
                $0.center.equalToSuperview()
            }
        }
        
    }
    
    
    final class SideAlignedHeader: UI.View {
        
        public override var intrinsicContentSize: CGSize {
            .init(width: UIView.noIntrinsicMetric, height: 56)
        }
        
        public lazy var title = Label("Navigation Title")
            .pageTitle32(.semiBold)
            .textColor(UIColor.Basic.black).with {
                $0.numberOfLines = 0
            }
        
        public lazy var backButton = UI.RoundedButton(
            icon: systemIcon("arrow.backward")?.imageFlippedForRightToLeftLayoutDirection()
        )
        .withWidth(56).withHeight(56)
        .with {
            $0.backgroundColor = .clear
            $0.highlightedBackgroundColor = .clear
            $0.iconImageView.tintColor = UIColor.Basic.black
        }
        
        private lazy var navigationHeaderContainer = UI.View()
            .subViews(backButton, title)
            .withHeight(200)
            .with { $0.backgroundColor = .clear }
        
        public override func commonInit() {
            super.commonInit()
            embed {
                navigationHeaderContainer
            }
            backButton.snp.makeConstraints {
                $0.leftRTL.equalToSuperview()
                $0.centerY.equalToSuperview()
            }
            title.snp.makeConstraints {
                $0.leftRTL.equalTo(backButton).offset(50)
                $0.rightRTL.equalToSuperview().inset(40)
                $0.top.equalTo(backButton.snp.bottom)
            }
        }
        
    }
    
}

