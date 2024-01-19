//
//  ContentView.swift
//  HW 1
//
//  Created by PHYS 440 Marco on 1/12/24.
//

import SwiftUI

struct ContentView: View {
    // States the variables to hold user input and the calculated results
    @State private var radiusInput: String = ""
    @State private var calculatedVolume: Double?
    @State private var calculatedSurfaceArea: Double?
    @State private var boundingBoxVolume: Double?
    @State private var boundingBoxSurfaceArea: Double?
    @State private var errorMessage: String?

    var body: some View {
        VStack(alignment: .leading) {
            // Sphere Properties
            Text("Sphere")
                .font(.title)
                .underline()

            Text("Input radius of sphere:")

            // Text field for user input for sphere radius
            TextField("Radius", text: $radiusInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Button for calculation of sphere properties
            Button("Calculate Sphere Properties") {
                calculateSphereProperties()
            }
            .padding()

            // Error message if input is invalid
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            } else {
                // Display sphere properties if it is calculated
                if let volume = calculatedVolume, let surfaceArea = calculatedSurfaceArea {
                    Text("The volume of a sphere with radius \(radiusInput) is: \(volume)")
                    Text("The surface area of sphere with radius \(radiusInput) is: \(surfaceArea)")
                }
            }

            // Division of seperation
            Divider()

            // Bounding Box Properties
            Text("Bounding Box")
                .font(.title)
                .underline()

            Text("The volume of a bounding box is defined as:")

            // Display error message if input is invalid for bounding box
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            } else {
                // Display bounding box properties if calculated
                if let boundingBoxVolume = boundingBoxVolume, let boundingBoxSurfaceArea = boundingBoxSurfaceArea {
                    Text("Volume: \(boundingBoxVolume)")
                    Text("Surface Area: \(boundingBoxSurfaceArea)")
                }
            }
        }
        .padding()
    }

    // Calculate of sphere and bounding box properties
    private func calculateSphereProperties() {
        // Validate and convert user input to a numeric value
        guard let radius = Double(radiusInput), radius >= 0 else {
            // Handle invalid input
            errorMessage = "Error: Please enter a valid non-negative number for the radius."
            return
        }

        // Reset error message if input is valid
        errorMessage = nil

        // Calculation of sphere properties
        calculatedVolume = (4.0 / 3.0) * Double.pi * pow(radius, 3)
        calculatedSurfaceArea = 4 * Double.pi * pow(radius, 2)

        // Calculation of bounding box properties
        let minX = -radius
        let maxX = radius
        let minY = -radius
        let maxY = radius
        let minZ = -radius
        let maxZ = radius

        let width = maxX - minX
        let height = maxY - minY
        let depth = maxZ - minZ

        // Dimensional validation for the bounding box
        guard width >= 0, height >= 0, depth >= 0 else {
            // Handle invalid input for bounding box
            errorMessage = "Error: Invalid dimensions for the bounding box. Please enter a valid non-negative number for the radius."
            return
        }

        // Reset error message if input for bounding box is valid
        errorMessage = nil

        // Calculation of bounding box properties
        boundingBoxVolume = width * height * depth
        boundingBoxSurfaceArea = 2 * (width * height + height * depth + width * depth)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
