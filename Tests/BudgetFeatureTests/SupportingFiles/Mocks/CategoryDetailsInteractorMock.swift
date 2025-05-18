//
//  CategoryDetailsInteractorMock.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 18/05/2025.
//
@testable import BudgetFeature

struct CategoryDetailsInteractorMock: CategoryDetailsInteractorProtocol {
    let entityMock: CategoryDetailsEntity
    var error: Error?

    init(entityMock: CategoryDetailsEntity, error: Error? = nil) {
        self.entityMock = entityMock
        self.error = error
    }

    func fetchCategoryDetailsEntity(for type: CategoryType) async throws -> CategoryDetailsEntity {
        if let error = error {
            throw error
        }
        return entityMock
    }
}
