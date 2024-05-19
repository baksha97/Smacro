import ArgumentParser
import Foundation
import Path
//
//protocol BaseInput: Codable {
//  var projectPath: ProjectPath { get }
//  var verbose: Bool { get }
//  var noTty: Bool { get }
//  var noColor: Bool { get }
//}
//
//protocol BaseValidator {
//  associatedtype InputType
//  func validate() async throws -> InputType
//}
//
//
//enum BaseCommandError: FatalError {
//  case inputParsingError(String)
//  
//  var context: String {
//    switch self {
//    case .inputParsingError:
//      return "Error occurred while parsing input"
//    }
//  }
//  
//  var nextSteps: [String] {
//    switch self {
//    case .inputParsingError:
//      return ["Ensure all input parameters are correct"]
//    }
//  }
//  
//  var description: String {
//    switch self {
//    case let .inputParsingError(message):
//      return message
//    }
//  }
//}
//
//class BaseCommand<Input: BaseInput>: AsyncParsableCommand, BaseValidator {
//  
//  required init() {
//    
//  }
//  
//  func validate() async throws -> Input {
//    fatalError("Subclasses need to implement the validate method.")
//  }
//  
//  @Argument(
//    help: "The path to the workspace or project. When not passed, it defaults to any workspace or project in the current directory.",
//    completion: .file(),
//    transform: { try AbsolutePath(validating: $0, relativeTo: .currentWorkingDirectory) }
//  )
//  var path: AbsolutePath?
//  
//  @Flag(
//    help: "When passed it outputs the verbose version of the logs"
//  )
//  var verbose: Bool = false
//  
//  @Flag(
//    help: "Forces disabling the interactive experience"
//  )
//  var noTty: Bool = false
//  
//  @Flag(
//    help: "Forces disabling the colored experience"
//  )
//  var noColor: Bool = false
//  
//  func runCommand() async throws {
//    fatalError("Subclasses need to implement the `runCommand()` method.")
//  }
//  
//  func run() async throws {
//    do {
//      let input = try await validate()
//      try await runCommand(with: input)
//    } catch {
//      throw BaseCommandError.inputParsingError(error.localizedDescription)
//    }
//  }
//  
//  func runCommand(with input: Input) async throws {
//    fatalError("Subclasses need to implement the `runCommand(with:)` method.")
//  }
//  
//}
