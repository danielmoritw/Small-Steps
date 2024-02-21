//
//  StepsModel.swift
//  Small Steps
//
//  Created by Dan Mori on 09/02/24.
//

import Foundation
import HealthKit
import CoreMotion

@MainActor
class StepsModel: ObservableObject {
    @Published var steps: [Step] = []
    @Published var todaySteps: Int = 0
    private var healthStore: HealthStoreProtocol?
    private var pedometer: CMPedometer?
    @Published var liveSteps: Int = 0
    @Published var isPedometerActive: Bool = false
    
    init(healthStore: HealthStoreProtocol) {
        self.healthStore = healthStore
        pedometer = CMPedometer()
    }
    
    private func fetchSteps(fromStatistics statisticsCollection: HKStatisticsCollection) {
        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
        let endDate = Date()
        statisticsCollection.enumerateStatistics(from: startDate, to: endDate) { (statistics, stop) in
            let count = statistics.sumQuantity()?.doubleValue(for: .count())
            let step = Step(count: Int(count ?? 0), date: statistics.startDate)
            DispatchQueue.main.async {
                self.steps.append(step)
                self.todaySteps = self.steps.last?.count ?? 0
            }
        }
    }
    
    func loadSteps() {
        steps = []
        if let healthStore = healthStore {
            healthStore.requestAuthorization { success in
                if success {
                    healthStore.calculateSteps { statisticsCollection in
                        if let statisticsCollection = statisticsCollection {
                            self.fetchSteps(fromStatistics: statisticsCollection)
                        }
                    }
                }
            }
        }
    }
    
    func togglePedometer() {
        isPedometerActive.toggle()
        if isPedometerActive {
            startPedometer()
        } else {
            stopPedometer()
        }
    }
    
    private func startPedometer() {
        liveSteps = 0
        if isPedometerAvailable {
            pedometer?.startUpdates(from: Date(), withHandler: { data, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    self.liveSteps = data.numberOfSteps.intValue
                }
            })
        }
    }
    
    private func stopPedometer() {
        pedometer?.stopUpdates()
    }
    
    private var isPedometerAvailable: Bool {
        return CMPedometer.isPedometerEventTrackingAvailable() && CMPedometer.isDistanceAvailable() && CMPedometer.isStepCountingAvailable()
    }
}
