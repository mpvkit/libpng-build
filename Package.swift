// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "libpng",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13)],
    products: [
        .library(
            name: "libpng",
            targets: ["_libpng"]
        ),
    ],
    targets: [
        // Need a dummy target to embedded correctly.
        // https://github.com/apple/swift-package-manager/issues/6069
        .target(
            name: "_libpng",
            dependencies: ["Libpng"],
            path: "Sources/_Dummy"
        ),
        //AUTO_GENERATE_TARGETS_BEGIN//

        .binaryTarget(
            name: "Libpng",
            url: "https://github.com/mpvkit/libpng-build/releases/download/1.6.43/Libpng.xcframework.zip",
            checksum: "6afd53171f0361f027079a1e9f4d5501573d7e6c1bb2cda6d1440aac61bc15f6"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
