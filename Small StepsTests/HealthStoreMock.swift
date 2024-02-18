//
//  HealthStoreMock.swift
//  Small StepsTests
//
//  Created by Dan Mori on 17/02/24.
//

import Foundation
import HealthKit

@testable import Small_Steps

class HealthStoreMock: HealthStoreProtocol {
    
    var hasAuthorization: Bool
    
    init(hasAuthorization: Bool = true) {
        self.hasAuthorization = hasAuthorization
    }
    
    func calculateSteps(completion: @escaping (HKStatisticsCollection?) -> Void) {
        completion(nil)
    }
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        completion(hasAuthorization)
    }
    
    
}
