//
//  Union.swift
//  Object3D
//
//  Created by Jeremy Bannister on 7/12/18.
//

import Geometry3DValueTypes

// MARK: - --> Initial Declaration <--
public struct Union: Object3D {
  public var position: Position3D
  public var objects: [Object3D]
  
  public init (position: Position3D, objects: [Object3D]) {
    self.position = position
    self.objects = objects
  }
}

// MARK: - Conversion to RawObject3D
extension Union {
  public var asRawObject3D: RawObject3D {
    return .union(position: position, rawObjects: objects.mapToRawObject3D)
  }
}
