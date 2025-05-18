//
//  RequestProtocol.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 17/05/2025.
//

import Foundation

protocol RequestProtocol {
    associatedtype Entity: EntityProtocol

    var httpMethod: String? { get }
    var urlComponents: URLComponents? { get set }
}

extension RequestProtocol {
    func decode(_ data: Data) async throws -> Entity {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        do {
            let model = try decoder.decode(Entity.Model.self, from: data)
            return Entity(model: model)
        } catch {
            throw error
        }
    }
}
