//
//  CategoryDetailsEntityMock.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 18/05/2025.
//

@testable import BudgetFeature

extension CategoryDetailsEntity {
    static var mock: Self {
        .init(title: "Title",
              subtitle: "Subtitle",
              amountSpent: 200,
              budget: 500,
              transactions: [
                TransactionsEntity.mock1,
                TransactionsEntity.mock2,
                TransactionsEntity.mock3
              ])
    }
}

extension TransactionsEntity {
    static var mock1: Self {
        .init(title: "Test title 1",
              dateString: "Sun 17 May",
              amountString: "30")
    }

    static var mock2: Self {
        .init(title: "Test title 2",
              dateString: "Sun 17 May",
              amountString: "50")
    }

    static var mock3: Self {
        .init(title: "Test title 3",
              dateString: "Sun 17 May",
              amountString: "80")
    }
}
