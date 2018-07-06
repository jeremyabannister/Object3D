//
//  Object3D.swift
//  Object3D
//
//  Created by Jeremy Bannister on 7/2/18.
//

@_exported import Geometry3DValueTypes

// MARK: - --> Initial Declaration <--
public protocol Object3D: RawObject3DConvertible, HasPosition3D {
  var position: Position3D { get set }
}

// MARK: - Translation
extension Object3D {
  public func translated (by vector: Vector3D) -> Self {
    var copy = self
    copy.position = copy.position.translated(by: vector)
    return copy
  }
  public func translated (by x: Double, _ y: Double, _ z: Double) -> Self {
    return translated(by: .init(x, y, z))
  }
}

// MARK: - Map
extension Sequence where Element == Object3D {
  public var mapToRawObject3D: [RawObject3D] {
    return self.map({ $0.asRawObject3D })
  }
}
