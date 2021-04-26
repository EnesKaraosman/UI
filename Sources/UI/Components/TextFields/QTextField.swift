//
//  QTextField.swift
//  
//
//  Created by Enes Karaosman on 25.02.2021.
//

import SnapKit
import UIKit

public class QTextField: UITextField {
    
    public enum State {
        case empty
        case focus
        case error
        case success
        case filled
    }
    
    public var textFieldState: State = State.empty {
        didSet {
            switch textFieldState {
            case .focus:
                titlePlaceholderLabel.textColor = UIColor.Basic.orange
                borderView.layer.borderColor = UIColor.Basic.orange.cgColor
                backgroundColor = .white
                tintColor = UIColor.Basic.orange
            case .success:
                titlePlaceholderLabel.textColor = .extraGreen
                borderView.layer.borderColor = UIColor.extraGreen.cgColor
                backgroundColor = UIColor.Pastel.lightGreen
                tintColor = .extraGreen
            case .error:
                titlePlaceholderLabel.textColor = .extraRed
                borderView.layer.borderColor = UIColor.extraRed.cgColor
                backgroundColor = UIColor.Pastel.lightRed
                tintColor = .extraRed
            default:
                titlePlaceholderLabel.textColor = UIColor.gray3
                borderView.layer.borderColor = UIColor.gray3.cgColor
                backgroundColor = .white
                tintColor = UIColor.Basic.black
            }
        }
    }
    
    public lazy var titlePlaceholderLabel = PaddingLabel("Label")
        .body14(.regular)
        .with {
            $0.topInset = 1
            $0.leftInset = 3
            $0.rightInset = 3
            $0.bottomInset = 1
            $0.layer.cornerRadius = 3
            $0.layer.masksToBounds = true
            $0.textColor(UIColor.gray3)
            $0.backgroundColor = .white
        }
    
    private lazy var togglePasswordButton = Button("").with {
        let img = UIImage(named: "iconShowPassword")?.withRenderingMode(.alwaysTemplate)
        let tintColor = UIColor.gray3
        $0.backgroundColor = .clear
        $0.setImage(img, for: .normal)
        $0.tintColor = tintColor
        $0.onTapGesture = {
            self.didPressTogglePassword()
        }
    }
    public var padding = UIEdgeInsets.allEdges(14)
    
    public var isPasswordField: Bool = false {
        didSet {
            if isPasswordField {
                isSecureTextEntry = true
                // make a space on right for eye icon
                padding = UIEdgeInsets(top: 14, left: 14, bottom: 14, right: 34)
                togglePasswordButton.isHidden = false
            }
            else {
                isSecureTextEntry = false
                padding = UIEdgeInsets.allEdges(14)
                togglePasswordButton.isHidden = true
            }
        }
    }
    
    private lazy var borderView = UIView().with {
        $0.layer.borderColor = UIColor.gray4.cgColor
        $0.layer.borderWidth = 2
        $0.layer.cornerRadius = 4
        $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        $0.frame = bounds
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(self.becomeFirstResponder)
            )
        )
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: 62)
    }

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    open func commonInit() {
        
        addSubview(borderView)
        
        layer.cornerRadius = 4
        
        font = .init(.rubik, .custom(16), .regular)
        textColor = UIColor.Basic.black

        insertSubview(titlePlaceholderLabel, aboveSubview: self)
        titlePlaceholderLabel.snp.makeConstraints {
            $0.leftRTL.equalToSuperview().inset(14)
            $0.top.equalToSuperview().offset(-8)
        }
        
        addSubview(togglePasswordButton)
        togglePasswordButton.isHidden = true
        togglePasswordButton.snp.makeConstraints {
            $0.height.width.equalTo(16)
            $0.centerY.equalToSuperview()
            $0.rightRTL.equalToSuperview().inset(14)
        }
    }
    
    private func didPressTogglePassword() {
        // show or hide password text
        isSecureTextEntry = !isSecureTextEntry
        // update image
        let img: UIImage?
        if isSecureTextEntry {
            img = UIImage(named: "iconShowPassword")?.withRenderingMode(.alwaysTemplate)
        }
        else {
            img = UIImage(named: "iconHidePassword")?.withRenderingMode(.alwaysTemplate)
        }
        togglePasswordButton.setImage(img, for: .normal)
    }
}
