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
    //function used to populate data in current user login
    static func fetchUsers() async throws ->[User]{
        guard let currentUid = Auth.auth().currentUser?.uid else {return []}
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap({try? $0.data(as: User.self)})
        return users.filter({$0.id != currentUid})
    }
    func reset(){
        self.currentUser = nil
    }
}
