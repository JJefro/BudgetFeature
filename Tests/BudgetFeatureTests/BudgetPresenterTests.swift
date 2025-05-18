import Testing

@testable import BudgetFeature

@Suite("Unit tests for BudgetPresenter business logic")
struct BudgetPresenterTests {
    @Test("Should load data and update state to .content")
    func fetchData_success() async throws {
        let interactorMock = BudgetInteractorMock(entityMock: .mock)
        let presenter = await BudgetPresenter(interactor: interactorMock)

        try await #require(
            presenter.uiModel.state == .loading,
            "Expected initial .loading state before fetching data"
        )

        await presenter.fetchData()

        if case let .content(entity) = await presenter.uiModel.state {
            #expect(entity == .mock)
        } else {
            Issue.record("Expected .content state after successful fetch")
        }
    }

    @Test("Should handle error and update state to .error")
    func fetchData_failure() async throws {
        let interactorMock = BudgetInteractorMock(
            entityMock: .mock,
            error: TestError.fetchFailed
        )
        let presenter = await BudgetPresenter(interactor: interactorMock)

        try await #require(
            presenter.uiModel.state == .loading,
            "Expected initial .loading state before fetching data"
        )

        await presenter.fetchData()

        if case let .error(description) = await presenter.uiModel.state {
            #expect(
                description == TestError.fetchFailed.localizedDescription
            )
        } else {
            Issue.record("Expected .error state after failed fetch")
        }
    }
}
