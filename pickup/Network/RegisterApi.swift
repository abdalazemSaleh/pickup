//
//  RegisterApi.swift
//  pickup
//
//  Created by magdi sherif on 11/07/2023.
//

import Foundation
import Alamofire
import SwiftyJSON


class RegisterApi {
    
    static let shared = RegisterApi()
    
    struct MyParms: Codable {
        var f_name: String
        var l_name: String
        var phone: String
        var email: String
        var password: String
        var password_confirmation: String
        init(){
            self.f_name = "jnrfjnjfnj"
            self.l_name = "lastName"
            self.phone = "123123123"
            self.email = "emfjnvnail@gmail.com"
            self.password =  "password"
            self.password_confirmation = "passwordConfiramtion"
        }
    }
    
    
    func registerApi(firstName: String, lastName: String, email: String, password: String, passwordConfiramtion: String, phone: String?, combletion: @escaping (Result<RegisterModel, Error>) -> Void) {
      
//        let requestBody = MyParms()
//        let encoder = JSONEncoder()
//        guard let requestBodyData = try? encoder.encode(requestBody) else {
//            // Handle the error if encoding fails
//            return
//        }
//
//
//        AF.upload(requestBodyData, to: "https://pickupksa.com/PickUp/api/user/register")
//            .validate()
//            .responseDecodable(of: RegisterModel.self) { response in
//                switch response.result {
//                case .success(let data):
//                    // Handle the decoded data here
//                    print(data)
//                case .failure(let error):
//                    // Handle the error
//                    print(error)
//                }
//            }
        
  
        
            
//                let params = [
//                            "f_name": firstName,
//                            "l_name": lastName,
//                            "phone": "55555555",
//                            "email": email,
//                            "password": password,
//                            "password_confirmation": passwordConfiramtion
//                        ]
                //
                //        let request = MyRe
                //
                //        AF.uplod(r)
                
        let url = "https://pickupksa.com/PickUp/api/user/register"
        let params = [
            "f_name": firstName,
            "l_name": lastName,
            "phone": "55555555",
            "email": email,
            "password": password,
            "password_confirmation": passwordConfiramtion
        ]
        AF.request(url, method: .post, parameters: params, encoder: JSONParameterEncoder.default).responseData { response in
            
                
            let jsonData = JSON(response.value ?? "")
            print(jsonData)
            let decoder = JSONDecoder()
                
            do {
            let newAccount = try decoder.decode(RegisterModel.self, from: jsonData.rawData())
                combletion(.success(newAccount))
            } catch let error {
                combletion(.failure(error))
            }
                
         }
        
    }
    
    
    
    
}
