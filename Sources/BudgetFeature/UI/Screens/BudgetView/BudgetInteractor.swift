//
//  BudgetInteractor.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 17/05/2025.
//

import Foundation

protocol BudgetInteractorProtocol: Sendable {
    func fetchBudgetOverviewEntity() async throws -> BudgetOverviewEntity
}

final class BudgetInteractor: BudgetInteractorProtocol, @unchecked Sendable {
    private let budgetService: BudgetServiceProtocol

    init(budgetService: BudgetServiceProtocol = BudgetService()) {
        self.budgetService = budgetService
    }

    nonisolated func fetchBudgetOverviewEntity() async throws -> BudgetOverviewEntity {
        try await Task.detached(priority: .background) {
            try await self.budgetService.perform(request: BudgetOverviewRequest())
        }.value
    }
}
