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
    @State private var loadingTask: Task<Void, Never>? = nil
    private let interactor: CategoryDetailsInteractorProtocol
    
    init(uiModel: CategoryDetailsUIModel = CategoryDetailsUIModel(state: .loading),
         interactor: CategoryDetailsInteractorProtocol = CategoryDetailsInteractor()) {
        self.uiModel = uiModel
        self.interactor = interactor
    }

    func startLoading(for type: CategoryType) {
        loadingTask?.cancel()
        loadingTask = Task { await fetchData(for: type) }
    }

    func stopLoading() {
        loadingTask?.cancel()
        loadingTask = nil
    }

    func fetchData(for type: CategoryType) async {
        uiModel.state = .loading
        do {
            let entity = try await interactor.fetchCategoryDetailsEntity(for: type)
            uiModel.state = .content(entity)
        } catch {
            uiModel.state = .error(error)
        }
    }
}
