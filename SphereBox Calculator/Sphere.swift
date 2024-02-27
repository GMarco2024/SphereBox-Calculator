//
//  Sphere.swift
//  HW 1
//
//  Created by PHYS 440 Marco on 1/18/24.
//

import Foundation

//We make the class for the the Sphere

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

// Volume of Sphere
//
//        4     3
//[ V  =  - pi r  ]
//        3
//
        
        let volume = (4.0 / 3.0) * Double.pi * pow(radius, 3)
     
//              2
//[ A  =  4 pi r  ]
        
        let surfaceArea = 4 * Double.pi * pow(radius, 2)

        return (volume, surfaceArea)
        
    }

}

