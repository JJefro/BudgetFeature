//
//  CategoryDetailsUIModel.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 18/05/2025.
//

struct CategoryDetailsUIModel {
    var state: CategoryDetailsState
}

enum CategoryDetailsState: Equatable {
    case loading
    case content(CategoryDetailsEntity)
    case error(desctiption: String)
}
