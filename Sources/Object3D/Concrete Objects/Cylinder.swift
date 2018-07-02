//
//  Cylinder.swift
//  Geometry3DValueTypes
//
//  Created by Jeremy Bannister on 7/2/18.
//

import Geometry3DValueTypes

public struct Cylinder: Object3D, Equatable {
  public var position: Position3D
  public var lowerRadius: Double
  public var upperRadius: Double
  public var depth: Double
  
  public init (position: Position3D, lowerRadius: Double, upperRadius: Double, depth: Double) {
    self.position = position
    self.lowerRadius = lowerRadius
    self.upperRadius = upperRadius
    self.depth = depth
  }
  
  public var asObject3DEnum: Object3DEnum {
    return .cylinder(position: position, lowerRadius: lowerRadius, upperRadius: upperRadius, depth: depth)
  }
}
