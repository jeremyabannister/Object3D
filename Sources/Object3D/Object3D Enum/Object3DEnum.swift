//
//  Object3DEnum.swift
//  Object3D
//
//  Created by Jeremy Bannister on 7/2/18.
//

@_exported import Geometry3DValueTypes

public indirect enum Object3DEnum {
  // Primitives
  case cube (position: Position3D, size: Size3D)
  case cylinder (position: Position3D, lowerRadius: Double, upperRadius: Double, depth: Double)
  
  // Composites
  case union (position: Position3D, objectEnums: [Object3DEnum])
  case difference (position: Position3D, original: Object3DEnum, subtractions: [Object3DEnum])
}
