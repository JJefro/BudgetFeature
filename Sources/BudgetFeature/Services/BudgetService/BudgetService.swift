//
//  BudgetService.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 17/05/2025.
//

import Foundation

protocol BudgetServiceProtocol {
    func perform<Request: RequestProtocol>(request: Request) async throws -> Request.Entity
}

final class BudgetService: BudgetServiceProtocol {
    func perform<Request: RequestProtocol>(request: Request) async throws -> Request.Entity {
        /// Since we don't have a real API to get the data, this simulates a network request by loading a local JSON file
        try await Task.sleep(for: .seconds(1))
        do {
            let url = try await getMockURL(for: request)
            let data = try Data(contentsOf: url)
            return try await request.decode(data)
        } catch {
            throw error
        }
    }

    private func getMockURL<Request: RequestProtocol>(for request: Request) async throws -> URL {
        switch request {
        case is BudgetOverviewRequest:
            guard let url = Bundle.module.url(forResource: "budget_overview_mock", withExtension: "json") else {
                throw BudgetServiceError.fileNotFound
            }
            return url
        case let request as CategoryDetailsRequest:
            guard let url = Bundle.module.url(forResource: "category_detail_\(request.type.rawValue.lowercased())_mock", withExtension: "json") else {
                throw BudgetServiceError.fileNotFound
            }
            return url
        default: throw BudgetServiceError.unsupportedRequest
        }
    }
}
