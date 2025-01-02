//
//  User.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2025-01-02.
//

import Foundation
struct User: Identifiable,Codable{
    let id: String
    let fullname: String
    let email: String
    let username: String
    var bio: String?
    var profileImage: String?
}
