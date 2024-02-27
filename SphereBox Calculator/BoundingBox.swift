//
//  BoundingBox.swift
//  HW 1
//
//  Created by PHYS 440 Marco on 1/18/24.
//

import Foundation

class BoundingBox: ObservableObject {
    @Published var radius: Double

    init(radius: Double) {
        self.radius = radius
    }

// Function to calculate the bounding box properties
    
// Since the bounding box would be a cube encapsulating the sphere
    
    func calculateBoundingBoxProperties() -> (volume: Double, surfaceArea: Double)? {
        let sideLength = radius * 2

//Volume = sideLength^3
        
        let volume = pow(sideLength, 3)

//Surface Area = 6(sidelength^2)
        
        let surfaceArea = 6 * pow(sideLength, 2)

        return (volume, surfaceArea)
    }
}
