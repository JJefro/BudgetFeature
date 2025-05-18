//
//  BudgetUIModel.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 17/05/2025.
//

struct BudgetUIModel {
    var state: BudgetViewState
    var navigationTitle: String = "Budget Overview"
}

enum BudgetViewState: Equatable {
    case content(BudgetOverviewEntity)
    case loading
    case error(description: String)
}
