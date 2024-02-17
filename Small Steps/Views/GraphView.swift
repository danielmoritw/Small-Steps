//
//  GraphView.swift
//  Small Steps
//
//  Created by Dan Mori on 08/02/24.
//

import SwiftUI

struct GraphView: View {
    let steps: [Step]
    
    private var totalSteps: Int {
        steps.map { $0.count }.reduce(0,+)
    }
    
    var body: some View {
        VStack {
            Text("Weekly Insights")
            ScrollView(.horizontal) {
                HStack(alignment: .lastTextBaseline) {
                    ForEach(steps, id: \.id) { step in
                        let yValue = Swift.min(step.count/30, 300)
                        VStack {
                            Text("\(step.count)")
                            Rectangle()
                                .fill(step.count > 10000 ? .green : .red)
                                .frame(width: 20, height: CGFloat(yValue))
                            Text(step.date.dayAndMonthNumeric)
                        }
                    }
                }.frame(maxWidth: .infinity)
            }
            Text("Total steps: \(totalSteps)")
                .padding()
        }
    }
}

#Preview {
    GraphView(steps: [Step(count: 5000, date: Date()), Step(count: 7482, date: Date()), Step(count: 1849, date: Date()), Step(count: 10849, date: Date())])
}
