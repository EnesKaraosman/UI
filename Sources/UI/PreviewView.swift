//
//  PreviewView.swift
//  
//
//  Created by Enes Karaosman on 30.12.2020.
//

#if canImport(SwiftUI)
import SwiftUI

/**
 struct DetailViewController_Previews: PreviewProvider {
     static var previews: some View {
         PreviewViewController(for: ContentViewController())
             .environment(\.colorScheme, .dark)
             .edgesIgnoringSafeArea(.all)
     }
 }
 */

public extension UIViewController {

    @available(iOS 13, *)
    func asPreview() -> some SwiftUI.View {
        PreviewViewController(for: self)
    }
    
}

public extension UIView {

    @available(iOS 13, *)
    func asPreview() -> some SwiftUI.View {
        PreviewView(for: self)
    }
    
}


@available(iOS 13, *)
public struct LocalizedPreview<Content: SwiftUI.View>: SwiftUI.View {
    
    /// Filter out "base" to prevent a duplicate preview.
    private let localizations = Bundle.main.localizations
        .map(Locale.init)
        .filter { $0.identifier != "base" }
    
    private let viewToPreview: Content
    
    public init(@ViewBuilder viewToPreview: () -> Content) {
        self.viewToPreview = viewToPreview()
    }
    
    public var body: some SwiftUI.View {
        ForEach(localizations, id: \.self) { locale in
            viewToPreview
                .environment(\.locale, locale)
                .previewDisplayName(
                    Locale.current.localizedString(forIdentifier: locale.identifier)
                )
        }
    }
    
}

@available(iOS 13, *)
public struct ContentSizeCategoryPreview<Content: SwiftUI.View>: SwiftUI.View {
    
    private let dynamicTypeSizes: [ContentSizeCategory] = [
        .extraSmall,
        .large,
        .extraExtraExtraLarge
    ]
    
    private let viewToPreview: Content
    
    public init(@ViewBuilder viewToPreview: () -> Content) {
        self.viewToPreview = viewToPreview()
    }
    
    public var body: some SwiftUI.View {
        ForEach(dynamicTypeSizes, id: \.hashValue) { sizeCategory in
            viewToPreview
                .environment(\.sizeCategory, sizeCategory)
                .previewDisplayName("\(sizeCategory)")
        }
    }
    
}

/// Preview View Controllers
public struct PreviewViewController<ViewControllerType: UIViewController>: UIViewControllerRepresentable {
    
    private let `for`: ViewControllerType
    public init(for controller: ViewControllerType) {
        self.`for` = controller
    }
    
    public func makeUIViewController(context: Context) -> ViewControllerType {
        `for`
    }
    
    public func updateUIViewController(_ viewController: ViewControllerType, context: Context) {
        
    }
    
}

/// Preview Views
public struct PreviewView<ViewType: UIView>: UIViewRepresentable {
    
    private let `for`: ViewType
    public init(for view: ViewType) {
        self.`for` = view
    }
    
    public func makeUIView(context: Context) -> ViewType {
        `for`
    }
    
    public func updateUIView(_ uiView: ViewType, context: Context) {
        
    }
    
}



#endif
