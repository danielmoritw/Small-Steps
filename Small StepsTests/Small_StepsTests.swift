//
//  Small_StepsTests.swift
//  Small StepsTests
//
//  Created by Dan Mori on 08/02/24.
//

import XCTest
@testable import Small_Steps

final class Small_StepsTests: XCTestCase {
    
    func test_healthStore_initialization() {
        let sut = HealthStore()
        XCTAssertNotNil(sut.healthStore)
        XCTAssertNil(sut.query)
    }
    
    
    
}
