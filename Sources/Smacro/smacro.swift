import ArgumentParser
import Foundation
import PathKit
import Yams
import JSONUtilities
import Rainbow
import XcodeProj
import SmacroKit

@main
private enum smacro {
    static func main() async throws {
//        await SmacroCommand.main()
      try await devMain() 
    }
}

func devMain() async throws {
  
}
