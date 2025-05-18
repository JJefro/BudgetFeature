//
//  BudgetOverviewEntity.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 17/05/2025.
//

import Foundation

struct BudgetOverviewEntity: EntityProtocol {
    var totalBudget: String
    var totalAmountSpent: String
    var title: String
    var categories: [CategoryEntity]
}

extension BudgetOverviewEntity {
    init(model: BudgetOverviewModel) {
        totalBudget = model.totalBudget.formatCurrency()
        totalAmountSpent = model.totalAmountSpent.formatCurrency()
        title = "You've spent \(model.currency.symbol)\(totalAmountSpent) of your \(model.currency.symbol)\(totalBudget) budget"
        categories = model.categories.map { CategoryEntity(model: $0, currency: model.currency) }
    }
}

struct CategoryEntity: EntityProtocol {
    var type: CategoryType
    var name: String
    var amountSpent: Double
    var budget: Double
    var amountTitle: String = ""
}

extension CategoryEntity {
    init(model: CategoryModel) {
        type = model.type
        name = model.name
        amountSpent = model.amountSpent
        budget = model.budget
    }

    init(model: CategoryModel, currency: Currency) {
        self.init(model: model)
        amountTitle = "\(currency.symbol)\(model.amountSpent.formatCurrency()) of \(currency.symbol)\(model.budget.formatCurrency())"
    }
}

