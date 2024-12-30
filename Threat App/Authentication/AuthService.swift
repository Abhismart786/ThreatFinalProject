//
//  AuthService.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2024-12-30.
//

import FirebaseAuth
class AuthService{
    static let shared = AuthService()
    @MainActor
    func login(withEmail email:String,password: String) async throws{
        
    }
    @MainActor
    func createUser(withEmail email:String,password: String,fullname:String,username:String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: Created user \(result.user.uid)")
        }catch{
            print("DEBUG Failed to create user\(error.localizedDescription)")
        }
    }
}
