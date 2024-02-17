//
//  Small_StepsApp.swift
//  Small Steps
//
//  Created by Dan Mori on 08/02/24.
//

import SwiftUI

@main
struct Small_StepsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(StepsModel())
        }
    }
}
