//
//  Difference.swift
//  Object3D
//
//  Created by Jeremy Bannister on 7/9/18.
//

import Geometry3DValueTypes

// MARK: - --> Initial Declaration <--
public struct Difference: Object3D {
  public var position: Position3D
  public var original: Object3D
  public var subtractions: [Object3D]
  
  public init (position: Position3D, original: Object3D, subtractions: [Object3D]) {
    self.position = position
    self.original = original
    self.subtractions = subtractions
  }
}

// MARK: - Conversion to RawObject3D
extension Difference {
  public var asRawObject3D: RawObject3D {
    return .difference(position: position, original: original.asRawObject3D, subtractions: subtractions.mapToRawObject3D)
  }
}
