// SphereBox_CalculatorTests.swift
import XCTest
@testable import SphereBox_Calculator

class SphereBox_CalculatorTests: XCTestCase {

    func testSpherePropertiesCalculation() {
        let sphere = Sphere(radius: 2.0)
        let sphereProperties = sphere.calculateSphereProperties()

        XCTAssertNotNil(sphereProperties)
        XCTAssertEqual(sphereProperties?.volume, 33.510321638291124)
        XCTAssertEqual(sphereProperties?.surfaceArea, 50.26548245743669)
    }

    func testBoundingBoxPropertiesCalculation() {
        let boundingBox = BoundingBox(radius: 2.0)
        let boundingBoxProperties = boundingBox.calculateBoundingBoxProperties()

        XCTAssertNotNil(boundingBoxProperties)
        XCTAssertEqual(boundingBoxProperties?.volume, 64.0)
        XCTAssertEqual(boundingBoxProperties?.surfaceArea, 96.0)
    }

}

}
