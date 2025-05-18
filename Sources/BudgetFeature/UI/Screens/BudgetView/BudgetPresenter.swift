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
    private let interactor: BudgetInteractorProtocol

    init(uiModel: BudgetUIModel = BudgetUIModel(state: .loading),
         interactor: BudgetInteractorProtocol = BudgetInteractor()) {
        self.uiModel = uiModel
        self.interactor = interactor
    }

    func fetchData() async {
        do {
            let entity = try await self.interactor.fetchBudgetOverviewEntity()
            uiModel.state = .content(entity)
        } catch {
            uiModel.state = .error(error)
        }
    }
}

