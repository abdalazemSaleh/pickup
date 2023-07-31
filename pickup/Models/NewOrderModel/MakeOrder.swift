//
//  MakeOrder.swift
//  pickup
//
//  Created by magdi sherif on 13/07/2023.
//

import Foundation

// MARK: - RegisterModel
struct MakeOrderModel: Codable {
    let status: Bool?
    let msg: String?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let van: [Van]?
    let type: [TypeElement]?

    enum CodingKeys: String, CodingKey {
        case van = "Van"
        case type = "Type"
    }
}

// MARK: - TypeElement
struct TypeElement: Codable {
    let id: Int?
    let name: String?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Van
struct Van: Codable {
    let id: Int?
    let name: String?
    let image: String?
    let minGo, maxGo, maxWight: String?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, name, image
        case minGo = "min_go"
        case maxGo = "max_go"
        case maxWight = "max_wight"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
