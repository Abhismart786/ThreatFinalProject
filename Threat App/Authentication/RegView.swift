//
//  RegView.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2024-12-30.
//

import Foundation
class RegView: ObservableObject{
    
    @Published var email = ""
    @Published  var password = ""
    @Published  var fullname = ""
    @Published var username = ""
    @MainActor
    func createUser() async throws{
        try await AuthService.shared.createUser(withEmail: email, password: password, fullname: fullname, username: username)
    }
}
