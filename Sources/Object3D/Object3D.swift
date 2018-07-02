//
//  Object3D.swift
//  Object3D
//
//  Created by Jeremy Bannister on 7/2/18.
//

import Geometry3DValueTypes

public protocol Object3D: Equatable, Object3DEnumConvertible, Position3DShortcuts {
  var position: Position3D { get set }
}

extension Object3D {
  public func translated (by vector: Position3D) -> Self {
    var copy = self
    copy.position = copy.position + vector
    return copy
  }
  public func translated (by x: Double, _ y: Double, _ z: Double) -> Self {
    return translated(by: Position3D(x: x, y: y, z: z))
  }
}
