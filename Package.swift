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
            dependencies: ["libpng"],
            path: "Sources/_Dummy"
        ),
        //AUTO_GENERATE_TARGETS_BEGIN//

        .binaryTarget(
            name: "libpng",
            url: "https://github.com/mpvkit/libpng-build/releases/download/1.6.43/libpng.xcframework.zip",
            checksum: "8b7de06a4ac58240c13a71922cf01773802165600f1b190f58f01b11912ca4db"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
