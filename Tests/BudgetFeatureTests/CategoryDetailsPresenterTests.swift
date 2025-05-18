//
//  CategoryDetailsPresenterTests.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 18/05/2025.
//

import Testing

@testable import BudgetFeature

@Suite("Unit tests for CategoryDetailsPresenter business logic")
struct CategoryDetailsPresenterTests {
    @Test("Should load data and update state to .content")
    func fetchData_success() async throws {
        let interactorMock = CategoryDetailsInteractorMock(entityMock: .mock)
        let presenter = await CategoryDetailsPresenter(
            interactor: interactorMock
        )

        try await #require(
            presenter.uiModel.state == .loading,
            "Expected initial .loading state before fetching data"
        )

        await presenter.fetchData(for: CategoryType(rawValue: "food"))

        if case let .content(entity) = await presenter.uiModel.state {
            #expect(entity == .mock)
        } else {
            Issue.record("Expected .content state after successful fetch")
        }
    }

    @Test("Should handle error and update state to .error")
    func fetchData_failure() async throws {
        let interactorMock = CategoryDetailsInteractorMock(
            entityMock: .mock,
            error: TestError.fetchFailed
        )
        let presenter = await CategoryDetailsPresenter(
            interactor: interactorMock
        )

        try await #require(
            presenter.uiModel.state == .loading,
            "Expected initial .loading state before fetching data"
        )

        await presenter.fetchData(for: CategoryType(rawValue: "food"))

        if case let .error(description) = await presenter.uiModel.state {
            #expect(
                description
                    == TestError.fetchFailed.localizedDescription
            )
        } else {
            Issue.record("Expected .error state after failed fetch")
        }
    }
}
