// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftAssert",
    products: [
        .library(
            name: "SwiftAssert",
            targets: ["SwiftAssert"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftAssert",
            dependencies: []
        ),
        .testTarget(
            name: "SwiftAssertTests",
            dependencies: ["SwiftAssert"]
        )
    ]
)
