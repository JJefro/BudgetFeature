//
//  BudgetView.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 17/05/2025.
//

import SwiftUI

public struct BudgetView: View {
    @ObservedObject var presenter: BudgetPresenter

    init(presenter: BudgetPresenter = BudgetPresenter()) {
        self.presenter = presenter
    }

    public var body: some View {
        NavigationStack {
            buildBodyContent()
                .task {
                    await presenter.fetchData()
                }
                .navigationTitle(presenter.uiModel.navigationTitle)
        }
    }

    @ViewBuilder
    private func buildBodyContent() -> some View {
        switch presenter.uiModel.state {
        case .loading:
            ProgressView()
        case let .error(error):
            Text(error.localizedDescription)
        case let .content(entity):
            buildContentView(entity)
        }
    }

    @ViewBuilder
    private func buildContentView(_ entity: BudgetOverviewEntity) -> some View {
        List {
            Section(header: Text(entity.title)
                .textCase(nil)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
                .fontWeight(.bold)) {
                    ForEach(entity.categories) { category in
                        NavigationLink(destination: CategoryDetailsView(categoryType: category.type)) {
                            buildCategoryItemView(category)
                        }
                    }
                }
        }
    }

    @ViewBuilder
    private func buildCategoryItemView(_ entity: CategoryEntity) -> some View {
        VStack {
            HStack {
                Text(entity.name)
                Spacer()
                Text(entity.amountTitle)
            }
            .font(.headline)
            ProgressView(value: entity.amountSpent, total: entity.budget)
                .tint(.green)
                .padding([.top, .bottom], 10)
        }
        .padding([.top, .bottom], 10)
    }
}

#Preview {
    BudgetView()
}
