//
//  BudgetPresenter.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 17/05/2025.
//

import SwiftUI

@MainActor
final class BudgetPresenter: ObservableObject {
    @Published var uiModel: BudgetUIModel = BudgetUIModel(state: .loading)
    @State private var loadingTask: Task<Void, Never>? = nil
    private let interactor: BudgetInteractorProtocol

    init(uiModel: BudgetUIModel = BudgetUIModel(state: .loading),
         interactor: BudgetInteractorProtocol = BudgetInteractor()) {
        self.uiModel = uiModel
        self.interactor = interactor
    }

    func startLoading() {
        loadingTask?.cancel()
        loadingTask = Task { await fetchData() }
    }

    func stopLoading() {
        loadingTask?.cancel()
        loadingTask = nil
    }

    func fetchData() async {
        uiModel.state = .loading
        do {
            let entity = try await interactor.fetchBudgetOverviewEntity()
            uiModel.state = .content(entity)
        } catch {
            uiModel.state = .error(description: error.localizedDescription)
        }
    }
}

