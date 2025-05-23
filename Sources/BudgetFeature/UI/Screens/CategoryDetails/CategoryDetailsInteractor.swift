//
//  CategoryDetailsInteractor.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 18/05/2025.
//

import Foundation

protocol CategoryDetailsInteractorProtocol: Sendable {
    func fetchCategoryDetailsEntity(for type: CategoryType) async throws -> CategoryDetailsEntity
}

final class CategoryDetailsInteractor: CategoryDetailsInteractorProtocol, @unchecked Sendable {
    private let budgetService: BudgetServiceProtocol

    init(budgetService: BudgetServiceProtocol = BudgetService()) {
        self.budgetService = budgetService
    }

    nonisolated func fetchCategoryDetailsEntity(for type: CategoryType) async throws -> CategoryDetailsEntity {
        try await Task.detached(priority: .background) {
            try await self.budgetService.perform(request: CategoryDetailsRequest(type: type))
        }.value
    }
}
