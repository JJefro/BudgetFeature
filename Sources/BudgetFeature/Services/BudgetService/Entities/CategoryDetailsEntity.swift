//
//  CategoryDetailEntity.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 17/05/2025.
//

struct CategoryDetailsEntity: EntityProtocol {
    var title: String
    var subtitle: String
    var amountSpent: Double
    var budget: Double
    var transactions: [TransactionsEntity]
}

extension CategoryDetailsEntity {
    init(model: CategoryDetailsModel) {
        title = "\(model.category) Budget"
        subtitle = "Spent \(model.currency.symbol)\(model.amountSpent.formatCurrency()) of \(model.currency.symbol)\(model.budget.formatCurrency())"
        amountSpent = model.amountSpent
        budget = model.budget
        transactions = model.transactions.map { TransactionsEntity(model: $0, currency: model.currency) }
    }
}

struct TransactionsEntity: EntityProtocol {
    var title: String
    var dateString: String
    var amountString: String = ""
}

extension TransactionsEntity {
    init(model: TransactionsModel) {
        title = model.title
        dateString = model.date.formattedString()
    }

    init(model: TransactionsModel, currency: Currency) {
        self.init(model: model)
        amountString = "\(currency.symbol)\(model.amount.formatCurrency())"
    }
}
