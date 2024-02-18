//
//  ContentView.swift
//  Small Steps
//
//  Created by Dan Mori on 08/02/24.
//

import SwiftUI
import HealthKit

enum StepsViewType {
    case total
    case live
}

struct ContentView: View {
    @EnvironmentObject private var stepsModel: StepsModel
    @State private var stepsViewType: StepsViewType = .total
    
    var body: some View {
        
        NavigationView {
            ZStack {
                if stepsViewType == .total {
                    LinearGradient(gradient: Gradient(colors: [Color(red: 254/255, green: 180/255, blue: 123/255), Color(red: 255/255, green: 126/255, blue: 95/255)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .ignoresSafeArea()
                } else {
                    LinearGradient(gradient: Gradient(colors: [Color(red: 0/255, green: 100/255, blue: 121/255), Color(red: 0/255, green: 212/255, blue: 255/255)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .ignoresSafeArea()
                }
                
                VStack {
                    Picker("View Type", selection: $stepsViewType) {
                        Text("Total").tag(StepsViewType.total)
                        Text("Live").tag(StepsViewType.live)
                    }
                    .pickerStyle(.segmented)
                    .foregroundStyle(.orange)
                    
                    if stepsViewType == .total {
                        TotalCountView(todaySteps: stepsModel.todaySteps, steps: stepsModel.steps)
                            .task {
                                stepsModel.loadSteps()
                            }
                    } else {
                        LiveCountingView(steps: stepsModel.liveSteps, isActive: stepsModel.isPedometerActive) {
                            stepsModel.togglePedometer()
                        }
                        Spacer()
                    }
                    
                    Spacer()
                }.padding(20)
                
            }.navigationTitle("Small Steps")
            
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(StepsModel(healthStore: HealthStore()))
}
