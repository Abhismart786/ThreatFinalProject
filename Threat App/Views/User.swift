

import Foundation
import FirebaseAuth
import FirebaseFirestore
//Hashable allows your User object to be compared and used in collections that rely on hashing, such as Set or as keys in a dictionary
struct User: Identifiable,Codable,Hashable{
    let id: String
    let fullname: String
    let email: String
    let username: String
    var bio: String?
   
    let password: String
    var link: String?
}


class UserService{
    @Published var currentUser: User?
    static let shared = UserService()
    // costructor used to fetch current user login
    init(){
        Task {try await fetchCurrentUser()}
    }
    // function used to fetch current user data if it exists
    @MainActor
    func fetchCurrentUser() async throws{
        // guard is used to run the code more fast for example if the user is nill
        // it exist the program quickly
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
        let users = snapshot.documents.compactMap({try? $0.data(as: User.self)})//compactmap is used to filtering data if the user is nill it will descriminate the value from the user array to make array clean
        return users.filter({$0.id != currentUid})
    }
    func reset(){
        self.currentUser = nil
    }
}
