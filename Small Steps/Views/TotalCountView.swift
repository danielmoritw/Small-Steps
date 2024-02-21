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
                    .font(.system(size: 32))
                    .fontWeight(.bold)
            }.padding([.top], 20)
        }.padding([.bottom], 40)
        
        Spacer()
        
        GraphView(steps: steps)
            .foregroundColor(.white)
            .padding()
            .background(.white.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 25))
            
    }
}

#Preview {
    TotalCountView(todaySteps: 20, steps: [Step(count: 300, date: Date())])
}
