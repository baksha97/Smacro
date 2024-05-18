// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Smacro",
  platforms: [.macOS(.v10_13)],
  products: [
    .executable(name: "smacro", targets: ["Smacro"]),
    .library(name: "SmacroKit", targets: ["SmacroKit"]),
    .library(name: "SmacroModels", targets: ["SmacroModels"])
  ],
  dependencies: [
    .package(url: "https://github.com/kylef/PathKit.git", from: "1.0.1"),
    .package(url: "https://github.com/jpsim/Yams.git", from: "5.0.0"),
    .package(url: "https://github.com/yonaskolb/JSONUtilities.git", from: "4.2.0"),
    .package(url: "https://github.com/kylef/Spectre.git", from: "0.9.2"),
    .package(url: "https://github.com/onevcat/Rainbow.git", from: "4.0.0"),
    .package(url: "https://github.com/tuist/XcodeProj.git", exact: "8.13.0"),
    .package(url: "https://github.com/jakeheis/SwiftCLI.git", from: "6.0.3"),
    .package(url: "https://github.com/mxcl/Version", from: "2.0.0"),
    .package(url: "https://github.com/SwiftDocOrg/GraphViz.git", exact: "0.2.0"),
    .package(url: "https://github.com/freddi-kit/ArtifactBundleGen", exact: "0.0.6")
  ],
  targets: [
    .executableTarget(name: "Smacro", dependencies: [
      "SmacroCLI",
      "Version",
    ]),
    .target(name: "SmacroCLI", dependencies: [
      "SmacroKit",
      "SmacroModels",
      "SwiftCLI",
      "Rainbow",
      "PathKit",
      "Version",
    ]),
    .target(name: "SmacroKit", dependencies: [
      "SmacroModels",
      "JSONUtilities",
      "XcodeProj",
      "PathKit",
      "SmacroCore",
      "GraphViz",
    ], resources: [
            .copy("SettingPreset")
    ]),
    .target(name: "SmacroModels", dependencies: [
      "JSONUtilities",
      "XcodeProj",
      "Yams",
      "SmacroCore",
      "Version",
    ]),
    .target(name: "SmacroCore", dependencies: [
      "PathKit",
      "Yams",
    ])
  ]
)
