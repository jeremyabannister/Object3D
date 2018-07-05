//
//  RawObject3D.swift
//  Object3D
//
//  Created by Jeremy Bannister on 7/2/18.
//

@_exported import Geometry3DValueTypes

public indirect enum RawObject3D {
  // Primitives
  case cube (position: Position3D, size: Size3D)
  case cylinder (position: Position3D, lowerRadius: Double, upperRadius: Double, depth: Double)
  
  // Composites
  case union (position: Position3D, rawObjects: [RawObject3D])
  case difference (position: Position3D, original: RawObject3D, subtractions: [RawObject3D])
}

extension RawObject3D {
  public static let empty: RawObject3D = .union(position: .zero, rawObjects: [])
}
