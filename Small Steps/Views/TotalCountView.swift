//
//  TotalCountView.swift
//  Small Steps
//
//  Created by Dan Mori on 14/02/24.
//

import SwiftUI

struct TotalCountView: View {
    var todaySteps: Int
    var steps: [Step]
    
    var body: some View {

        VStack {
            Text("Today's steps")
                .font(.title)
                .fontWeight(.bold)
            ZStack {
                CircleProgressView(progress: Double(todaySteps/10000))
                Text("\(todaySteps)")
                    .foregroundStyle(.white)
                    .font(.system(size: 42))
                    .fontWeight(.bold)
            }.padding([.top], 20)
        }
        Spacer()
        GraphView(steps: steps)
            .foregroundColor(.white)
    }
}

#Preview {
    TotalCountView(todaySteps: 20, steps: [Step(count: 300, date: Date())])
}
