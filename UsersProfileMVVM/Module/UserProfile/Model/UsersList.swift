//
//  UsersList.swift
//  UsersProfileMVVM
//
//  Created by Ahmed Amin on 09/09/2022.
//

import Foundation


struct UsersList: Codable {
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var address: Address?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case username
        case email
        case address
    }
}

struct Address: Codable {
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    
    enum CodingKeys: String, CodingKey {
        case street
        case suite
        case city
        case zipcode
    }
}

