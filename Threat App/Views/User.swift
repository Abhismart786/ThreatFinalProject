//
//  User.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2025-01-02.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
struct User: Identifiable,Codable{
    let id: String
    let fullname: String
    let email: String
    let username: String
    var bio: String?
    var profileImage: String?
    let password: String
}
class UserService{
    @Published var currentUser: User?
    static let shared = UserService()
    init(){
        Task {try await fetchCurrentUser()}
    }
    @MainActor
    func fetchCurrentUser() async throws{
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
    
    }
}
