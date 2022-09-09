//
//  UsersList.swift
//  UsersProfileMVVM
//
//  Created by Ahmed Amin on 09/09/2022.
//

import Foundation


struct UsersList: Codable {
    var name: String?
    var email: String?
    var address: Address?
    
    enum CodingKeys: String, CodingKey {
        case name, email, address
    }
}

struct Address: Codable {
    var street: String?
    var city: String?
    
    enum Codingkeys: String, CodingKey {
        case street, city
    }
}
