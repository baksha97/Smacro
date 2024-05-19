import Darwin
import Foundation
import Path
import SwiftTerminal

public actor SmacroContext: Context {
  public var isInteractive: Bool
  public var shouldColor: Bool
  public let envVariables: [String: String]
  public let currentWorkingDirectory: AbsolutePath
  public let cacheDirectory: AbsolutePath
  public let homeDirectory: AbsolutePath
  public let standardPipelines: StandardPipelines

  public init(
        isInteractive: Bool = SmacroContext.defaultIsInteractive(),
        shouldColor: Bool = SmacroContext.defaultShouldColor(),
        envVariables: [String: String] = SmacroContext.defaultEnvVariables(),
        currentWorkingDirectory: AbsolutePath = SmacroContext.defaultCurrentWorkingDirectory(),
        cacheDirectory: AbsolutePath = SmacroContext.defaultCacheDirectory(),
        homeDirectory: AbsolutePath = SmacroContext.defaultHomeDirectory(),
        standardPipelines: StandardPipelines = SmacroContext.defaultStandardPipelines()
    ) {
        self.isInteractive = isInteractive
        self.shouldColor = shouldColor
        self.envVariables = envVariables
        self.currentWorkingDirectory = currentWorkingDirectory
        self.cacheDirectory = cacheDirectory
        self.homeDirectory = homeDirectory
        self.standardPipelines = standardPipelines
    }
    
  public static func defaultCacheDirectory() -> AbsolutePath {
        if let xdgCacheHome = ProcessInfo.processInfo.environment["XDG_CACHE_HOME"] {
            try! AbsolutePath(validating: xdgCacheHome)
        } else {
            (try! AbsolutePath(validating: FileManager.default.homeDirectoryForCurrentUser.path())).appending(components: [
                ".cache",
                "smacro",
            ])
        }
    }
    
  public static func defaultStandardPipelines() -> StandardPipelines {
        return StandardPipelines()
    }
    
  public  static func defaultHomeDirectory() -> Path.AbsolutePath {
        return try! AbsolutePath(validating: FileManager.default.homeDirectoryForCurrentUser.path())
    }

  public  static func defaultCurrentWorkingDirectory() -> Path.AbsolutePath {
        try! AbsolutePath(validating: FileManager.default.currentDirectoryPath)
    }

  public static func defaultIsInteractive() -> Bool {
        !(ProcessInfo.processInfo.environment["XCODEHERO_NO_TTY"] != nil || ProcessInfo.processInfo.arguments.contains("--no-tty"))
    }

  public  static func defaultShouldColor() -> Bool {
        !(ProcessInfo.processInfo.environment["XCODEHERO_NO_COLOR"] != nil || ProcessInfo.processInfo.arguments
            .contains("--no-color"))
    }

  public  static func defaultEnvVariables() -> [String: String] {
        ProcessInfo.processInfo.environment
    }
}
