//
//  BoundingBox.swift
//  HW 1
//
//  Created by PHYS 440 Marco on 1/18/2024.
//

import Foundation

class BoundingBox {
    var radius: Double

    init(radius: Double) {
        self.radius = radius
    }

    // Function to calculate the bounding box properties
    func calculateBoundingBoxProperties() -> (volume: Double, surfaceArea: Double)? {
        let minX = -radius
        let maxX = radius
        let minY = -radius
        let maxY = radius
        let minZ = -radius
        let maxZ = radius

        let width = maxX - minX
        let height = maxY - minY
        let depth = maxZ - minZ

        // Validate dimensions for the bounding box
        guard width >= 0, height >= 0, depth >= 0 else {
            // Handle invalidation input for bounding box
            return nil
        }

        // Calculate bounding box properties
        let volume = width * height * depth
        let surfaceArea = 2 * (width * height + height * depth + width * depth)

        return (volume, surfaceArea)
    }
}

