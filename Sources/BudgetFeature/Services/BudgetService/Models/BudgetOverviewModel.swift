//
//  BudgetOverviewModel.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 17/05/2025.
//

struct BudgetOverviewModel: Codable {
    var totalBudget: Double
    var totalAmountSpent: Double
    var currency: Currency
    var categories: [CategoryModel]

    private enum CodingKeys: String, CodingKey {
        case totalBudget = "total_budget"
        case totalAmountSpent = "total_amount_spent"
        case currency, categories
    }
}

struct CategoryModel: Codable {
    var type: CategoryType
    var name: String
    var amountSpent: Double
    var budget: Double

    private enum CodingKeys: String, CodingKey {
        case type, name, budget
        case amountSpent = "amount_spent"
    }
}

struct CategoryType: RawRepresentable, Codable, Equatable {
    var rawValue: String
}

struct Currency: RawRepresentable, Codable, Equatable {
    var rawValue: String

    var symbol: String {
        switch self.rawValue.uppercased() {
        case "EUR": return "€"
        case "USD": return "$"
        default: return ""
        }
    }
}
