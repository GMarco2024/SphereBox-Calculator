//
//  Sphere.swift
//  HW 1
//
//  Created by PHYS 440 Marco on 1/18/24.
//

import Foundation

class Sphere {
    var radius: Double

    init(radius: Double) {
        self.radius = radius
    }

    // Function calculation of sphere properties
    func calculateSphereProperties() -> (volume: Double, surfaceArea: Double)? {
        guard radius >= 0 else {
            // Handle invalid input
            return nil
        }

        // Calculate sphere properties
        let volume = (4.0 / 3.0) * Double.pi * pow(radius, 3)
        let surfaceArea = 4 * Double.pi * pow(radius, 2)

        return (volume, surfaceArea)
    }
}
