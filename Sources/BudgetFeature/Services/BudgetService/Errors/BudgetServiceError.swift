//
//  BudgetServiceError.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 17/05/2025.
//

import Foundation

enum BudgetServiceError: Error {
    case fileNotFound
    case unsupportedRequest
}

extension BudgetServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "File not found"
        case .unsupportedRequest:
            return "Unsupported request"
        }
    }
}
