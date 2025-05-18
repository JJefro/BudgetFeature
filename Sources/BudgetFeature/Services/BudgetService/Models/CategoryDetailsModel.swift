//
//  CategoryDetailsModel.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 17/05/2025.
//

import Foundation

struct CategoryDetailsModel: Codable {
    var category: String
    var currency: Currency
    var amountSpent: Double
    var budget: Double
    var transactions: [TransactionsModel]

    private enum CodingKeys: String, CodingKey {
        case category, currency, budget, transactions
        case amountSpent = "amount_spent"
    }
}

struct TransactionsModel: Codable {
    var title: String
    var amount: Double
    var date: Date
}
