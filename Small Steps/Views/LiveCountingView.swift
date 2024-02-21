//
//  LiveCountingView.swift
//  Small Steps
//
//  Created by Dan Mori on 15/02/24.
//

import SwiftUI

struct LiveCountingView: View {
    var steps: Int = 0
    var isActive: Bool
    var action: () -> ()
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(steps)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            Text("Pedometer is \(isActive ? "active" : "inactive")")
                .foregroundStyle(.white)
            Spacer()
            Button(action: action) {
                Text("\(isActive ? "Stop" : "Start")")
            }
            .padding()
            .foregroundColor(.white)
            .background(.orange)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)

    }
}

#Preview {
    LiveCountingView(steps: 1000, isActive: false, action: {})
}
