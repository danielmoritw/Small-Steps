//
//  Step.swift
//  Small Steps
//
//  Created by Dan Mori on 08/02/24.
//

import Foundation

struct Step: Identifiable {
    let id = UUID()
    let count: Int
    let date: Date
}
