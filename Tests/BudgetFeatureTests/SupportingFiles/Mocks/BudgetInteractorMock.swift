//
//  BudgetInteractorMock.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 18/05/2025.
//
@testable import BudgetFeature

struct BudgetInteractorMock: BudgetInteractorProtocol {
    let entityMock: BudgetOverviewEntity
    var error: Error?

    init(entityMock: BudgetOverviewEntity, error: Error? = nil) {
        self.entityMock = entityMock
        self.error = error
    }

    func fetchBudgetOverviewEntity() async throws -> BudgetOverviewEntity {
        if let error = error {
            throw error
        }
        return entityMock
    }
}
