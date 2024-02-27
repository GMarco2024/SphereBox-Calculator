//
//  ContentView.swift
//  HW 1
//
//  Created by PHYS 440 Marco on 1/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var radiusInput: String = ""
    @State private var calculatedVolume: Double?
    @State private var calculatedSurfaceArea: Double?
    @State private var boundingBoxVolume: Double?
    @State private var boundingBoxSurfaceArea: Double?
    @State private var errorMessage: String?
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading) {
                // Sphere Properties
                Text("Sphere")
                    .underline(true)
                    .font(.system(size: 20))
                    .padding(.top, 20)
                
                Text("We calculate the volume of a sphere")
                    
                Spacer()
                Spacer()
                
                
                Text("Input radius of sphere:")
                
                // Text field for user input for sphere radius
                TextField("Radius", text: $radiusInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 450)
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
                
                // Division of separation
                Divider()
                
                // Bounding Box Properties
                Text("Bounding Box")
                    .underline(true)
                    .font(.system(size: 20))
                    .padding(.top, 20)
                
                Text("We now find the volume of the Bounding Box based on the sphere of radius \(radiusInput) from above:")
                
                // Display error message if input is invalid for bounding box
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    // Display bounding box properties if calculated
                    if let boundingBoxVolume = boundingBoxVolume, let boundingBoxSurfaceArea = boundingBoxSurfaceArea {
                        Text("Volume: \(boundingBoxVolume)")
                            .padding()
                        
                        Text("Surface Area: \(boundingBoxSurfaceArea)")
                    }
                }
            }
            .padding()
        }
    }
        
    
    
    private func calculateSphereProperties() {

    // Validate and convert user input to a numeric value
        
        guard let radius = Double(radiusInput), radius >= 0 else {
        
    // Handle invalid input
            
                errorMessage = "Error: Please enter a valid non-negative number for the radius."
                return
            
            }
            
            // Reset error message if input is valid
            errorMessage = nil
            
            // Create an instance of Sphere
            let sphere = Sphere(radius: radius)
            
            // Calculate sphere properties
            if let sphereProperties = sphere.calculateSphereProperties() {
                calculatedVolume = sphereProperties.volume
                calculatedSurfaceArea = sphereProperties.surfaceArea
            }
            
            // Create an instance of BoundingBox
            let boundingBox = BoundingBox(radius: radius)
            
            // Calculate bounding box properties
            if let boundingBoxProperties = boundingBox.calculateBoundingBoxProperties() {
                boundingBoxVolume = boundingBoxProperties.volume
                boundingBoxSurfaceArea = boundingBoxProperties.surfaceArea
            }
        }
    }

