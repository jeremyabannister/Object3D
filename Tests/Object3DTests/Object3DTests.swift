import XCTest
@testable import Object3D

final class Object3DTests: XCTestCase {
  
  // MARK: - Mock Object
  struct MockObject3D: Object3D {
    var position: Position3D
    let asRawObject3D: RawObject3D = .empty
  }
  
  // MARK: - Translation Tests
  func test_translatedBy () {
    let initial: Object3D = MockObject3D(position: .init(1, 2, 3))
    let subject = initial.translated(by: .init(4, 5, 6))
    XCTAssertEqual(subject.position, .init(5, 7, 9))
  }

    static var allTests = [
        ("test_translatedBy", test_translatedBy),
    ]
}
