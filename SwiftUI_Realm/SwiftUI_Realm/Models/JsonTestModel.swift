//
//  JsonTestModel.swift
//

import Foundation

// MARK: - JsonTestModel
struct JsonTestModel: Codable {
    let symbol, name, type: String
    let primary: Bool
}

typealias TestModel = [JsonTestModel]
