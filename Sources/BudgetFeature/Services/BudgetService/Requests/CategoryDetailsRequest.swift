//
//  CategoryDetailRequest.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 17/05/2025.
//

import Foundation

struct CategoryDetailsRequest: RequestProtocol {
    typealias Entity = CategoryDetailsEntity

    var type: CategoryType
    var httpMethod: String?
    var urlComponents: URLComponents?
}
