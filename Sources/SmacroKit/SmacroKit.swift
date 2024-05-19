import Foundation
import Foundation
import Path

public enum SmacroKit {
  
}



public protocol SmacroBuilding {
  func build() async throws
}

public extension SmacroKit {
  struct ProjectPath {
    let path: AbsolutePath
    let type: Kind
    enum Kind {
      case workspace, project, package
    }
  }
}
