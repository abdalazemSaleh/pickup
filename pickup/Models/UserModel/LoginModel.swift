//
//  LoginModel.swift
//  pickup
//
//  Created by magdi sherif on 11/07/2023.
//

import Foundation


// MARK: - LoginModel
struct LoginModel: Codable {
    let accessToken, tokenType: String?
    let expiresIn: Int?
    let user: User?
    var error: String?
    var phone: [String]?
    var password: [String]?

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case user, phone, password
    }
}


// MARK: - User
struct User: Codable {
    let id: Int
    let fName, lName, email: String
    let emailVerifiedAt: String?
    let phone: String
    let phoneVerifiedAt: String?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case fName = "f_name"
        case lName = "l_name"
        case email
        case emailVerifiedAt = "email_verified_at"
        case phone
        case phoneVerifiedAt = "phone_verified_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}




/*
 {
     "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3BpY2t1cGtzYS5jb20vUGlja1VwL2FwaS91c2VyL2xvZ2luIiwiaWF0IjoxNjg5MDc5MzgxLCJleHAiOjE2ODkwODI5ODEsIm5iZiI6MTY4OTA3OTM4MSwianRpIjoic1Rma3RVRXdUMFlaQW9kWiIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0._DghbXsFfZTRQSxZ5bI7rP1W_4ZVhnXqUxdvHpVTmM0",
     "token_type": "bearer",
     "expires_in": 3600,
     "user": {
         "id": 1,
         "f_name": "ali",
         "l_name": "hamada",
         "email": "ali@ali.com",
         "email_verified_at": null,
         "phone": "01001237654",
         "phone_verified_at": null,
         "created_at": "2023-07-09T23:48:19.000000Z",
         "updated_at": "2023-07-09T23:48:19.000000Z"
     }
 }
 */
