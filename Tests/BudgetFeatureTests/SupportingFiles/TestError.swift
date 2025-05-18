//
//  TestError.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 18/05/2025.
//

import Foundation

enum TestError: Error {
    case fetchFailed
}

extension TestError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .fetchFailed:
            return "Fetch failed"
        }
    }
}
