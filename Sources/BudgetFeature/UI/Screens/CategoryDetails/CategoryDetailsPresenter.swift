//
//  CategoryDetailsPresenter.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 18/05/2025.
//

import SwiftUI

@MainActor
final class CategoryDetailsPresenter: ObservableObject {
    @Published var uiModel: CategoryDetailsUIModel
    private let interactor: CategoryDetailsInteractorProtocol

    init(uiModel: CategoryDetailsUIModel = CategoryDetailsUIModel(state: .loading),
         interactor: CategoryDetailsInteractorProtocol = CategoryDetailsInteractor()) {
        self.uiModel = uiModel
        self.interactor = interactor
    }

    func fetchData(for type: CategoryType) async {
        do {
            let entity = try await interactor.fetchCategoryDetailsEntity(for: type)
            uiModel.state = .content(entity)
        } catch {
            uiModel.state = .error(error)
        }
    }
}
