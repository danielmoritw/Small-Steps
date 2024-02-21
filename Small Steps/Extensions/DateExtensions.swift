//
//  DateExtensions.swift
//  Small Steps
//
//  Created by Dan Mori on 08/02/24.
//

import Foundation

extension Date {
    var dayAndMonthNumeric: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM"
        return dateFormatter.string(from: self)
    }
}
