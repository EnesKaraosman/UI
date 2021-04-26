//
//  ComponentsDemoController.swift
//  
//
//  Created by Enes Karaosman on 6.01.2021.
//

import UIKit
import AloeStackView

public extension UIView {

    /// Adds Header View to this one.
    /// - Parameters:
    ///   - header: A `UIView` basically.
    ///   - spacing: The spacing between header view & this one.
    /// - Returns: The wrapped container.
    func addHeader(_ header: UIView, spacing: CGFloat = 4) -> UIView {
        UIStackView()
            .vertical(spacing: spacing)
            .views(header, self)
    }
    
    /// Adds Footer View to this one.
    /// - Parameters:
    ///   - footer: A `UIView` basically.
    ///   - spacing: The spacing between header view & this one.
    /// - Returns: The wrapped container.
    func addFooter(_ footer: UIView, spacing: CGFloat = 4) -> UIView {
        UIStackView()
            .vertical(spacing: spacing)
            .views(self, footer)
    }
    
    func enableUserInteraction() -> Self {
        with {
            $0.isUserInteractionEnabled = true
        }
    }
    
}

internal extension Label {
    func header() -> Self {
        with {
            $0.font = .init(.nunito, .footnote, .semiBold)
            $0.textColor = .gray
        }
    }
}

internal extension UIView {
    func alignLeftInStackView() -> UIStackView {
        UIStackView().horizontal().views(self, UIView.spacer)
    }
}

internal func systemIcon(_ systemName: String = "chevron.forward") -> UIImage? {
    if #available(iOS 13.0, *) {
        return UIImage(systemName: systemName)
    } else {
        return nil
    }
}

public final class ComponentsDemoController: AloeStackViewController {
    
    private lazy var navigationHeaders = ComponentFactory.Buttons.createDisclosureButton(
        "Navigation Headers", icon: systemIcon()
    ).with {
        $0.onTapGesture = { [weak self] in
            self?.navigationController?.pushViewController(NavigationHeadersDemoController(), animated: true)
        }
    }
    
    private lazy var labels = ComponentFactory.Buttons.createDisclosureButton(
        "Labels", icon: systemIcon()
    ).with {
        $0.onTapGesture = { [weak self] in
            self?.navigationController?.pushViewController(LabelsDemoViewController(), animated: true)
        }
    }
    
    private lazy var buttons = ComponentFactory.Buttons.createDisclosureButton(
        "Buttons", icon: systemIcon()
    ).with {
        $0.onTapGesture = { [weak self] in
            self?.navigationController?.pushViewController(ButtonsDemoViewController(), animated: true)
        }
    }
    
    private lazy var selectionLists = ComponentFactory.Buttons.createDisclosureButton(
        "Selection Lists", icon: systemIcon()
    ).with {
        $0.onTapGesture = { [weak self] in
            self?.navigationController?.pushViewController(SelectionListsDemoViewController(), animated: true)
        }
    }
    
    private lazy var segmentedPickers = ComponentFactory.Buttons.createDisclosureButton(
        "Segmented Pickers", icon: systemIcon()
    ).with {
        $0.onTapGesture = { [weak self] in
            self?.navigationController?.pushViewController(SegmentedPickersDemoViewController(), animated: true)
        }
    }
    
    private lazy var toggles = ComponentFactory.Buttons.createDisclosureButton(
        "Toggles", icon: systemIcon()
    ).with {
        $0.onTapGesture = { [weak self] in
            self?.navigationController?.pushViewController(TogglesDemoViewController(), animated: true)
        }
    }
    
    private lazy var progressViews = ComponentFactory.Buttons.createDisclosureButton(
        "Progress Views", icon: systemIcon()
    ).with {
        $0.onTapGesture = { [weak self] in
            self?.navigationController?.pushViewController(ProgressViewsDemoViewController(), animated: true)
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.addRows([
            navigationHeaders,
            labels,
            buttons,
            selectionLists,
            segmentedPickers,
            toggles,
            progressViews
        ])
        
        stackView.setInset(forRows: [
            navigationHeaders,
            labels,
            buttons,
            selectionLists,
            segmentedPickers,
            toggles,
            progressViews
        ], inset: .init(top: 0, left: 16, bottom: 0, right: 16))
        
    }
    
}
