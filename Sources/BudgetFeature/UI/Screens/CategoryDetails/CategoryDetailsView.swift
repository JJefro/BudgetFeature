//
//  CategoryDetailsView.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 18/05/2025.
//

import SwiftUI
import Charts

struct CategoryDetailsView: View {
    private var categoryType: CategoryType
    @StateObject var presenter = CategoryDetailsPresenter()

    init(categoryType: CategoryType) {
        self.categoryType = categoryType
    }

    var body: some View {
        buildBodyContent()
            .onAppear {
                presenter.startLoading(for: categoryType)
            }
            .onDisappear {
                presenter.stopLoading()
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
                LazyVStack(alignment: .center, pinnedViews: [.sectionHeaders]) {
                    Section(header:
                                ZStack {
                        Color(UIColor.systemBackground)
                        Text("Transactions")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(UIColor.systemBackground))
                            .padding()
                    }) {
                        ForEach(entity.transactions.indices, id: \.self) { index in
                            buildTransactionItem(entity.transactions[index])
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
