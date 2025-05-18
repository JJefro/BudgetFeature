//
//  Untitled.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 17/05/2025.
//

import Foundation

public protocol EntityProtocol: Equatable, Identifiable {
    associatedtype Model: Codable
    var id: UUID { get }

    init(model: Model)
}

public extension EntityProtocol {
    var id: UUID { UUID() }
}
