//
//  CategoryDetailsView.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 18/05/2025.
//

import SwiftUI
import Charts

public struct CategoryDetailsView: View {
    private var categoryType: CategoryType
    @ObservedObject var presenter: CategoryDetailsPresenter

    init(categoryType: CategoryType,
         presenter: CategoryDetailsPresenter = CategoryDetailsPresenter()) {
        self.categoryType = categoryType
        self.presenter = presenter
    }

    public var body: some View {
        buildBodyContent()
            .task {
                await presenter.fetchData(for: categoryType)
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
            ScrollView {
                LazyVStack(alignment: .center, pinnedViews: [.sectionHeaders]) {
                    VStack(spacing: 20) {
                        Text(entity.subtitle)
                            .font(.headline.bold())
                        PieChartView(title: entity.title,
                                     amountSpent: entity.amountSpent,
                                     budget: entity.budget)
                        .id("PieChart")
                        .frame(maxHeight: 300)
                    }
                    .padding()
                    Section(header:
                                ZStack {
                        Color(UIColor.systemBackground)
                        Text("Transactions")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(UIColor.systemBackground))
                            .padding()
                    }) {
                            ForEach(entity.transactions) { transaction in
                                buildTransactionItem(transaction)
                            }
                        }
                }
            }
        }
    }

    @ViewBuilder
    private func buildTransactionItem(_ entity: TransactionsEntity) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(entity.title)
                    .font(.body)
                    .foregroundStyle(.primary)
                Text(entity.dateString)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text(entity.amountString)
                .font(.body.bold())
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}

#Preview {
    CategoryDetailsView(categoryType: CategoryType(rawValue: "food"))
}
