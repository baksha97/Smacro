import ArgumentParser
import Foundation
import SwiftTerminal
import SmacroKit

public struct SmacroCommand: AsyncParsableCommand {
    public static let configuration = CommandConfiguration(
        commandName: "smacro",
        abstract: "xcodebuild with superpowers",
        subcommands: []
//        subcommands: [BuildCommand.self]
    )

    public init() {}

    public static func main() async {
        let context = SmacroContext()

        do {
            var command = try parseAsRoot()
            if var asyncCommand = command as? AsyncParsableCommand {
                try await asyncCommand.run()
            } else {
                try command.run()
            }
        } catch {
            if let _ = error as? CleanExit {
                exit(withError: error)
            } else if error.localizedDescription.contains("ArgumentParser") {
                exit(withError: error)
            } else if let fatalError = error as? FatalError {
                await CompletionMessage.render(
                    message: .error(
                        message: fatalError.description,
                        context: fatalError.context,
                        nextSteps: fatalError.nextSteps
                    ),
                    theme: smacroTheme,
                    environment: .init(isInteractive: context.isInteractive, shouldColor: context.shouldColor)
                )
            } else {
                await CompletionMessage.render(
                    message: .error(message: error.localizedDescription, context: nil, nextSteps: []),
                    theme: smacroTheme,
                    environment: .init(isInteractive: context.isInteractive, shouldColor: context.shouldColor)
                )
            }
            _exit(exitCode(for: error).rawValue)
        }
    }
}
