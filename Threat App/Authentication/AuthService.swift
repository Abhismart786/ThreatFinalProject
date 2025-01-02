//
//  AuthService.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2024-12-30.
//

import FirebaseAuth
import FirebaseFirestore
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
            try await uploadUserData(withEmail: email, fullname: fullname, username:username, id: result.user.uid)
        }catch{
            print("DEBUG Failed to create user\(error.localizedDescription)")
        }
    }
    func signOut(){
        try? Auth.auth().signOut() // signout on backend
        self.userSession = nil //removal of user session
    }
    @MainActor
    private func uploadUserData(withEmail email:String,fullname: String,username:String,id:String)async throws
    {
        let user = User(id: id, fullname: fullname, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user)
        else{
            return
        }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
    }
}
