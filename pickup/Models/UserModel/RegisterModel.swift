//
//  RegisterModel.swift
//  pickup
//
//  Created by magdi sherif on 11/07/2023.
//

import Foundation



struct RegisterModel: Codable {

    var accessToken: String?
    var tokenType: String?
    var expiresIn: Int?
    var user: UserRegister?
    var error: String?

    enum codingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
//        case User = "user"
    }
}


struct UserRegister: Codable {

    var id: Int?
    var firstName: String?
    var lastName: String?
    var email: String?
    var emailVerifiedAt: String?
    var phone: String?
    var phoneVerifiedAt: String?
    var createdAt: String?
    var updatedAt: String?

    enum codingKeys: String, CodingKey {

        case firstName = "f_name"
        case lastName = "l_name"
        case id = "id"
        case emailVerifiedAt = "email_verified_at"
        case phoneVerifiedAt = "phone_verified_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"

    }
}


//struct RegisterModel: Decodable {
//    let accessToken, tokenType: String?
//    let expiresIn: Int?
//    let user: UserRegister?
//    var error: String?
////    var email: [String]?
////    var firstName: [String]?
////    var password: [String]?
////    var lastName: [String]?
////    var phone: [String]?
//
//
//    enum CodingKeys: String, CodingKey {
//        case accessToken = "access_token"
//        case tokenType = "token_type"
//        case expiresIn = "expires_in"
//        case user
//    }
//}
//
//
//
//// MARK: - User
//struct UserRegister: Decodable {
//    let id: Int?
//    let firstName, lastName, email: String?
//    let emailVerifiedAt: String?
//    let phone: String?
//    let phoneVerifiedAt: String?
//    let createdAt, updatedAt: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case firstName = "f_name"
//        case lastName = "l_name"
////        case password
////        case passwordConfiramtion
//        case email
//        case emailVerifiedAt = "email_verified_at"
//        case phone
//        case phoneVerifiedAt = "phone_verified_at"
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//    }
//}



//struct ResponseModel: Codable {
//    let accessToken: String?
//    let tokenType: String?
//    let expiresIn: Int?
//    let user: UserModel?
//    var phone: [String]?
//    var fName: [String]?
//    var lName: [String]?
//    var email: [String]?
//    var password: [String]?
//}
//
//struct UserModel: Codable {
//    let id: Int?
//    let fName: String?
//    let lName: String?
//    let email: String?
//    let emailVerifiedAt: String?
//    let phone: String?
//    let phoneVerifiedAt: String?
//    let createdAt: String?
//    let updatedAt: String?
//}




/*
 
 {"f_name":["The f name field is required."],"l_name":["The l name field is required."],"phone":["The phone field is required."],"email":["The email field must be a string.","The email field must be a valid email address."],"password":["The password field is required."]}
 
 
 
 {
     "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3BpY2t1cGtzYS5jb20vUGlja1VwL2FwaS91c2VyL3JlZ2lzdGVyIiwiaWF0IjoxNjg5MTYwNjMwLCJleHAiOjE2ODkxNjQyMzAsIm5iZiI6MTY4OTE2MDYzMCwianRpIjoiR05HOXVnbHNCeUhxRk5sSCIsInN1YiI6IjYiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.16MmK5aXAvff6K5ogB9mfYPgJRpDxVz4yeRFBKnVmXw",
     "token_type": "bearer",
     "expires_in": 3600,
     "user": {
         "id": 6,
         "f_name": "ali",
         "l_name": "hamada",
         "email": "alii@ali.com",
         "email_verified_at": null,
         "phone": "010001237654",
         "phone_verified_at": null,
         "created_at": "2023-07-12T11:17:10.000000Z",
         "updated_at": "2023-07-12T11:17:10.000000Z"
     }
 }
 */
