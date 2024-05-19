import Darwin
import Foundation
import Path
import SwiftTerminal

public protocol Context: Actor {
    var envVariables: [String: String] { get }
    var currentWorkingDirectory: AbsolutePath { get }
    var cacheDirectory: AbsolutePath { get }
    var homeDirectory: AbsolutePath { get }
    var standardPipelines: StandardPipelines { get }
}
