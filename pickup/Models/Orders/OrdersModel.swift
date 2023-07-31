//
//  OrdersModel.swift
//  pickup
//
//  Created by magdi sherif on 10/07/2023.
//

import Foundation

struct Orders {
    var title: String
}



class orderType {
    var name: String?
    var isSelect: Bool = false
    
    init(name: String? = nil, isSelect: Bool? = false) {
        self.name = name
        self.isSelect = isSelect ?? false
    }
}
