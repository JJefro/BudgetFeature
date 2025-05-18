//
//  BudgetView.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 17/05/2025.
//

import SwiftUI

public struct BudgetView: View {
    @StateObject var presenter = BudgetPresenter()

    public init() {}

    public var body: some View {
        NavigationStack {
            buildBodyContent()
                .onAppear {
                    presenter.startLoading()
                }
                .onDisappear {
                    presenter.stopLoading()
                }
                .navigationTitle(presenter.uiModel.navigationTitle)
                .navigationDestination(for: CategoryType.self) { type in
                    CategoryDetailsView(categoryType: type)
                }
        }
    }

    @ViewBuilder
    private func buildBodyContent() -> some View {
        switch presenter.uiModel.state {
        case .loading:
            ProgressView()
        case let .error(description):
            Text(description)
        case let .content(entity):
            buildContentView(entity)
        }
    }

    @ViewBuilder
    private func buildContentView(_ entity: BudgetOverviewEntity) -> some View {
        List {
            Section(
                header: Text(entity.title)
                    .textCase(nil)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
            ) {
                ForEach(entity.categories.indices, id: \.self) { index in
                    let category = entity.categories[index]
                    NavigationLink(value: category.type) {
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
