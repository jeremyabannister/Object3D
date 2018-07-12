//
//  Polygon.swift
//  Object3D
//
//  Created by Jeremy Bannister on 7/12/18.
//

import Geometry3DValueTypes
import JBStandardLibraryExtensions

// MARK: - --> Initial Declaration <--
public struct Polygon {
  public var position: Position3D
  public var vertices: [Position3D]
  
  public init (position: Position3D, vertices: [Position3D]) {
    self.position = position
    self.vertices = vertices
  }
}

// MARK: - Extrusion
extension Polygon {
  public func zExtruded (through depth: Double) -> Polyhedron {
    let extrudedVertices = vertices.map({ $0.translated(by: 0, 0, depth) })
    var bottomFace: [Int] { return Array((0 ..< vertices.count).reversed()) }
    var sideFaces: [[Int]] {
      let vertexIndices = (0 ..< vertices.count).map({ $0 })
      return vertexIndices.map({
        var face = [0, 0, 0, 0]
        face[0] = $0
        face[1] = (face[0] + 1).cycled(toWithin: 0, vertices.count)
        face[2] = face[1] + vertices.count
        face[3] = (face[2] - 1).cycled(toWithin: 0, vertices.count)
        return face
      })
    }
    var topFace: [Int] { return bottomFace.reversed().map({ $0 + vertices.count }) }
    let faces: [[Int]] = [bottomFace] + sideFaces + [topFace]
    return Polyhedron(position: self.position, vertices: vertices + extrudedVertices, faces: faces)
  }
}
