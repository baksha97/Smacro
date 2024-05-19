// swift-tools-version: 5.10
import PackageDescription

let package = Package(
  name: "Smacro",
  platforms: [.macOS(.v13)],
  products: [
    .executable(name: "smacro", targets: ["Smacro"]),
    .library(name: "SmacroKit", targets: ["SmacroKit"])
  ],
  dependencies: [
    .package(url: "https://github.com/tuist/Command.git", from: "0.2.0"),
    .package(url: "https://github.com/kylef/PathKit.git", from: "1.0.1"),
    .package(url: "https://github.com/jpsim/Yams.git", from: "5.0.0"),
    .package(url: "https://github.com/yonaskolb/JSONUtilities.git", from: "4.2.0"),
    .package(url: "https://github.com/kylef/Spectre.git", from: "0.9.2"),
    .package(url: "https://github.com/onevcat/Rainbow.git", from: "4.0.0"),
    .package(url: "https://github.com/tuist/XcodeProj.git", exact: "8.13.0"),
    .package(url: "https://github.com/mxcl/Version", from: "2.0.0"),
    .package(url: "https://github.com/SwiftDocOrg/GraphViz.git", exact: "0.2.0"),
    .package(url: "https://github.com/freddi-kit/ArtifactBundleGen", exact: "0.0.6"),
    .package(url: "https://github.com/apple/swift-argument-parser", from: "1.3.1"),
    .package(url: "https://github.com/cpisciotta/xcbeautify", exact: "2.3.1"),
    .package(url: "https://github.com/tuist/SwiftTerminal", .upToNextMajor(from: "0.15.0")),
    .package(url: "https://github.com/PerfectlySoft/Perfect-INIParser.git", from: "3.0.0")
  ],
  targets: [
    .executableTarget(
      name: "Smacro",
      dependencies: [
        "SmacroKit",
        "GraphViz",
        "Rainbow",
        "SwiftTerminal",
        .product(name: "INIParser", package: "Perfect-INIParser"),
        .product(name: "XcbeautifyLib", package: "xcbeautify"),
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
      ]
    ),
    .target(
      name: "SmacroKit",
      dependencies: [
        "JSONUtilities",
        "XcodeProj",
        "PathKit",
        "Command",
        .product(name: "INIParser", package: "Perfect-INIParser"),
        .product(name: "XcbeautifyLib", package: "xcbeautify"),
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
      ]
    )
  ]
)
