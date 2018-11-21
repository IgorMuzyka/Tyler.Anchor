// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Tyler.Anchor",
    products: [
        .library(name: "Tyler.Anchor", targets: ["Anchor"]),
    ],
    dependencies: [
    .package(url: "https://github.com/IgorMuzyka/Tyler.Identifier", .branch("master")),
        .package(url: "https://github.com/IgorMuzyka/Tyler.Tag", .branch("master")),
    ],
    targets: [
        .target(name: "Anchor", dependencies: ["Tyler.Identifier", "Tyler.Tag"]),
    ]
)
