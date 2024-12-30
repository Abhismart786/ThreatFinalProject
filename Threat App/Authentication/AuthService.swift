//
//  AuthService.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2024-12-30.
//

import FirebaseAuth
class AuthService{
    
    @Published var userSession: FirebaseAuth.User?  // used to check the user loged in or not
    static let shared = AuthService()
    init(){
        self.userSession = Auth.auth().currentUser
    }
    @MainActor
    func login(withEmail email:String,password: String) async throws{
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: Created user \(result.user.uid)")
        }catch{
            print("DEBUG Failed to create user\(error.localizedDescription)")
        }
    }
    @MainActor
    func createUser(withEmail email:String,password: String,fullname:String,username:String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: Created user \(result.user.uid)")
        }catch{
            print("DEBUG Failed to create user\(error.localizedDescription)")
        }
    }
    func signOut(){
        try? Auth.auth().signOut() // signout on backend
        self.userSession = nil //removal of user session
    }
}
