import Foundation

do {
    let options = try ArgumentOptions.parse(CommandLine.arguments)
    try Build.performCommand(options)

    try BuildPng().buildALL()
} catch {
    print("ERROR: \(error.localizedDescription)")
    exit(1)
}


enum Library: String, CaseIterable {
    case libpng
    var version: String {
        switch self {
        case .libpng:
            return "v1.6.43"
        }
    }

    var url: String {
        switch self {
        case .libpng:
            return "https://github.com/glennrp/libpng"
        }
    }

    // for generate Package.swift
    var targets : [PackageTarget] {
        switch self {
        case .libpng:
            return  [
                .target(
                    name: "libpng",
                    url: "https://github.com/mpvkit/libpng-build/releases/download/\(BaseBuild.options.releaseVersion)/libpng.xcframework.zip",
                    checksum: "https://github.com/mpvkit/libpng-build/releases/download/\(BaseBuild.options.releaseVersion)/libpng.xcframework.checksum.txt"
                ),
            ]
        }
    }
}


private class BuildPng: BaseBuild {
    init() {
        super.init(library: .libpng)

        // no need run autogen.sh
        let autogen = directoryURL + "autogen.sh"
        try? FileManager.default.removeItem(at: autogen)
    }

    override func arguments(platform : PlatformType, arch : ArchType) -> [String] {
        [
            "-DPNG_SHARED=no",
            "-DPNG_TESTS=no",
            "-DPNG_FRAMEWORK=no",
            "-DPNG_TOOLS=no",
            platform == .maccatalyst ? "-DPNG_HARDWARE_OPTIMIZATIONS=no" : "-DPNG_HARDWARE_OPTIMIZATIONS=yes",
        ]
    }
}

