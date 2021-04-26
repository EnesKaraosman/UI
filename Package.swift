// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UI",
    platforms: [.iOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "UI",
            targets: ["UI"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.0.1"),
        .package(url: "https://github.com/yonat/SelectionList", from: "1.4.0"),
        .package(url: "https://github.com/marlimox/AloeStackView.git", from: "1.2.0"),
        .package(url: "https://github.com/EnesKaraosman/LBTATools", from: "1.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "UI",
            dependencies: [
                .byName(name: "SnapKit"),
                .byName(name: "SelectionList"),
                .byName(name: "AloeStackView"),
                .byName(name: "LBTATools")
            ],
            resources: [.process("Resources/Fonts"), .copy("Resources/Images")]
        ),
        .testTarget(
            name: "UITests",
            dependencies: ["UI"]),
    ]
)
