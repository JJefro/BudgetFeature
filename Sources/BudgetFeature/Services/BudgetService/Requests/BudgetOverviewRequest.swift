//
//  BudgetOverviewRequest.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 17/05/2025.
//

import Foundation

struct BudgetOverviewRequest: RequestProtocol {
    typealias Entity = BudgetOverviewEntity
    
    var httpMethod: String?
    var urlComponents: URLComponents?
}
