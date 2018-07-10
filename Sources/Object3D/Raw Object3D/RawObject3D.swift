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

extension RawObject3D {
  public func withPosition (_ newValue: Position3D) -> RawObject3D {
    var copy = self
    copy.position = newValue
    return copy
  }
  public var position: Position3D {
    get {
      switch self {
      case .cube(position: let position, size: _): return position
      case .cylinder(position: let position, lowerRadius: _, upperRadius: _, depth: _): return position
      case .union(position: let position, rawObjects: _): return position
      case .difference(position: let position, original: _, subtractions: _): return position
      }
    }
    set {
      switch self {
      case .cube(position: _, size: let size): self = .cube(position: newValue, size: size)
      case .cylinder(position: _, lowerRadius: let lowerRadius, upperRadius: let upperRadius, depth: let depth): self = .cylinder(position: newValue, lowerRadius: lowerRadius, upperRadius: upperRadius, depth: depth)
      case .union(position: _, rawObjects: let rawObjects): self = .union(position: newValue, rawObjects: rawObjects)
      case .difference(position: _, original: let original, subtractions: let subtractions): self = .difference(position: newValue, original: original, subtractions: subtractions)
      }
    }
  }
}
