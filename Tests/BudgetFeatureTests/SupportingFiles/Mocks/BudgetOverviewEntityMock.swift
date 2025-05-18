//
//  BudgetOverviewEntityMock.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 18/05/2025.
//

@testable import BudgetFeature

extension BudgetOverviewEntity {
    static var mock: Self {
        .init(totalBudget: "1000",
              totalAmountSpent: "600",
              title: "Test Title",
              categories: [
                CategoryEntity.mock1,
                CategoryEntity.mock2,
                CategoryEntity.mock3
              ])
    }
}

extension CategoryEntity {
    static var mock1: Self {
        .init(model: .init(type: CategoryType(rawValue: "food"),
                           name: "Food",
                           amountSpent: 200,
                           budget: 300),
              currency: Currency(rawValue: "EUR"))
    }

    static var mock2: Self {
        .init(model: .init(type: CategoryType(rawValue: "shopping"),
                           name: "Shopping",
                           amountSpent: 300,
                           budget: 500),
              currency: Currency(rawValue: "EUR"))
    }

    static var mock3: Self {
        .init(model: .init(type: CategoryType(rawValue: "travel"),
                           name: "Travel",
                           amountSpent: 100,
                           budget: 200),
              currency: Currency(rawValue: "EUR"))
    }
}
