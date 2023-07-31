//
//  OrderTypesNetwork.swift
//  pickup
//
//  Created by magdi sherif on 14/07/2023.
//

import Foundation
import Alamofire
import SwiftyJSON


class OrderTypesApi {
    
    static let shared = OrderTypesApi()
    
    func getActiveOrders(token: String, combletion: @escaping (Result<ActiveOrder, Error>) -> ()) {
        
        let url = "https://pickupksa.com/PickUp/api/order/active/"
        
        let authToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3BpY2t1cGtzYS5jb20vUGlja1VwL2FwaS91c2VyL2xvZ2luIiwiaWF0IjoxNjg5NTA3NzczLCJleHAiOjE2ODk1MTEzNzMsIm5iZiI6MTY4OTUwNzc3MywianRpIjoic1htZVBiVjg5QlF4eUNhdyIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.-1y4ueQt-eV48To258IiOa_222xzW7k0kTcxjhL4vpM"
        
        let headers: HTTPHeaders = [
            "auth-token" : authToken
        ]
        
        AF.request(url, headers: headers).responseJSON { response in
            
            let jsonData = JSON(response.data ?? "")
            print(jsonData)
            let decoder = JSONDecoder()
            
            do {
                let activeOrders = try decoder.decode(ActiveOrder.self, from: jsonData.rawData())
                combletion(.success(activeOrders))
            }catch {
                combletion(.failure(error))
            }
        }
        
    }
}
