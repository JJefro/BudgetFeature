//
//  Date+.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 17/05/2025.
//

import Foundation

extension Date {
    func formattedString() -> String {
        DateFormatter.mediumDateFormatter.string(from: self)
    }
}
