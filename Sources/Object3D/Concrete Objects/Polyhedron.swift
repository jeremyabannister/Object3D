//
//  Polyhedron.swift
//  Object3D
//
//  Created by Jeremy Bannister on 7/10/18.
//

@_exported import Geometry3DValueTypes

// MARK: - --> Initial Declaration <--
public struct Polyhedron: Object3D {
  public var position: Position3D
  public var vertices: [Position3D]
  public var faces: [[Int]]
  
  public init (position: Position3D, vertices: [Position3D], faces: [[Int]]) {
    self.position = position
    self.vertices = vertices
    self.faces = faces
  }
}

// MARK: - Conversion to RawObject3D
extension Polyhedron {
  public var asRawObject3D: RawObject3D {
    return .polyhedron(position: self.position, vertices: vertices, faces: faces)
  }
}
