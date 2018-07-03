//
//  Cube.swift
//  Geometry3DValueTypes
//
//  Created by Jeremy Bannister on 7/2/18.
//

@_exported import Geometry3DValueTypes

public struct Cube: Object3D, Equatable {
  public var position: Position3D
  public var size: Size3D
  
  public init (position: Position3D, size: Size3D) {
    self.position = position
    self.size = size
  }
  
  public var asObject3DEnum: Object3DEnum {
    return .cube(position: position, size: size)
  }
}

extension Cube: Position3DShortcuts { }
extension Cube: Size3DShortcuts { }
