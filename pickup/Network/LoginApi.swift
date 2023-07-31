//
//  LoginApi.swift
//  pickup
//
//  Created by magdi sherif on 11/07/2023.
//

import Foundation
import Alamofire
//import SwiftyJSON

//class UserApi {
//    
//    static let shared = UserApi()
//    
//    func loginUser(phone: String, password: String, combletion: @escaping (Result<LoginModel, Error>) -> ()) {
//        
//        let url = "https://pickupksa.com/PickUp/api/user/login"
//        let params = [
//            "phone": phone,
//            "password": password
//        ]
//        
//        
//        AF.request(url, method: .post, parameters: params, encoder: JSONParameterEncoder.default).responseJSON { response in
//            
//            let jsonData = JSON(response.value ?? "no data")
//            let decoder = JSONDecoder()
//            print(jsonData)
//            
//            do {
//                let loginUser = try decoder.decode(LoginModel.self, from: jsonData.rawData())
//                combletion(.success(loginUser))
//            }catch {
//                combletion(.failure(error))
//                print(error)
//            }
//            
//
//        }
//        
//    }
//}



// 
