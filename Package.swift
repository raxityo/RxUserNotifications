// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "RxUserNotifications",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_14),
    ],
    products: [
        .library(
            name: "RxUserNotifications",
            targets: ["RxUserNotifications"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift", .upToNextMajor(from: "6.1.0")),
    ],
    targets: [
        .target(
            name: "RxUserNotifications",
            dependencies: ["RxSwift"]
        ),
    ]
)
