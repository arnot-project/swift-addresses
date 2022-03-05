// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "swift-address",
    platforms: [
       .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "Address",
            targets: ["Address"]),
    ],
    dependencies: [
        .package(name: "Bech32", url: "https://github.com/arnot-project/swift-bech32", from: "1.0.0"),
        .package(name: "Blake2b", url: "https://github.com/arnot-project/swift-blake2b-224", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Address",
            dependencies: [
                "Blake2b",
                "Bech32"
            ]),
        .testTarget(
            name: "AddressTests",
            dependencies: ["Address"]),
    ]
)
