# UI

This package aims to simplify building UI with pre-built common components including Font & Color materials.


### Content
* [UI](#ui)
* [Font](#font)
* [Color](#color)
* [Preview](#preview)
* [Components](#components)

### UI

* #### `with`

We have `with` method that makes our job easier on UI elements, we can use it like below;

```swift
lazy var label = Label("Text").with {
    $0.textAlignment = .center
    $0.backgroundColor = .orange 
}
```

### Font

* #### Using Fonts

After you followed adding fonts instructions, make sure to call `UI.registerFonts()` function in your `AppDelegate` file. (prefer didFinishLaunching)

Then basically use UIFont init (an extension provided by this package);

```swift
Label().with {
    // Imagine your font is nunito
    $0.font = .init(.nunito, .custom(20), .regular)
    // For detail visit related initializer in `FontHelper` file
}
```

Also to simplify playing with fonts, you can create extensions (recommended way) like;

```swift
Label().title()

// Where title is;

func title() -> Label {
    with {
        $0.font = .init(.nunito, .custom(20), .regular)
    }
}
```

* #### Add new Fonts to Package

1. Simply add your Fonts (ttf files) to `Resources/Fonts` folder.
2. Add new `case` to `FontFamily` enum.
3. Make sure your font name postfix matches with the `FontWeight` cases. It is by default if you download from Google Fonts.
<br> 
Ex: Nunito-`Bold`, Nunito-`Regular`


* #### Remove Fonts from Package

1. Remove your ttf (font) files from `Resources/Fonts`
2. Remove related `case` from `FontFamily` enum.

---

### Color

You can simple create your color palette with an `UIColor` extension, visit `Colors.swift` file.

Even you can add light/dark mode colors with single line like;

```swift
let dynamicColor: UIColor = .white | .black
// Where | is custom operator checks current traitCollection (light/dark mode)
```

---

### Preview

Since SwiftUI brings realtime (almost) code/view presentation available why not use it! (requires iOS13+)

In the `UI` package a generic extension exist for avoiding representables.

* For `UIViewController`

```swift
 struct MyViewController_Previews: PreviewProvider {
     static var previews: some View {
         MyViewController()
             .asPreview()
             .environment(\.colorScheme, .dark)
             .edgesIgnoringSafeArea(.all)
     }
 }
```

* For `UIView`

```swift
 struct MyView_Previews: PreviewProvider {
     static var previews: some View {
         MyView()
            .asPreview()
     }
 }
```

---

### Components

For Common/Base components, see `Common` folder. <br />
Meaning you may never want to inherit from plain `UIButton` / `UILabel` again, instead to gain benefit from all pre-customized features prefer extending `Button`/`Label`. <br>
Also see their extensions (add if needed) how it is enriched with your `Fonts` & `Colors`. 
