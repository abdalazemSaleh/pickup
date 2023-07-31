//
//  ActiveOrderModel.swift
//  pickup
//
//  Created by magdi sherif on 14/07/2023.
//

import Foundation


// MARK: - ActiveOrder
struct ActiveOrder: Codable {
    let status: Bool?
    let msg: String?
    let data: [Datum]?
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int?
    let desc: String?
    let fromFloor, toFloor, hasElevator, hasWorker: Int?
    let fromLocationX, fromLocationY, toLocationX, toLocationY: String?
    let predictedPrice: String?
    let state, typeID, userID, vanID: Int?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, desc
        case fromFloor = "from_floor"
        case toFloor = "to_floor"
        case hasElevator = "has_elevator"
        case hasWorker = "has_worker"
        case fromLocationX = "from_location_x"
        case fromLocationY = "from_location_y"
        case toLocationX = "to_location_x"
        case toLocationY = "to_location_y"
        case predictedPrice = "predicted_price"
        case state
        case typeID = "type_id"
        case userID = "user_id"
        case vanID = "van_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
