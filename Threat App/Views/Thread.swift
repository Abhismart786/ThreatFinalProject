//
//  Thread.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2025-01-10.
//

import Firebase
import Foundation
import FirebaseFirestore
import FirebaseAuth
struct Thread: Identifiable,Codable{
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
   
    var likes: Int
    var id:String{
        return threadId ?? NSUUID().uuidString
    }
    var user: User?
}
class CreateThreadViewModel: ObservableObject{
    
    func uploadThread(caption:String) async throws{
        guard let uid = Auth.auth().currentUser?.uid else{return}
        let thread = Thread(ownerUid:uid, caption: caption,timestamp: Timestamp(),likes:0)
        try await ThreadService.uploadThread(thread)
    }
}
struct ThreadService{
    static func uploadThread(_ thread: Thread) async throws{
        guard let threadData = try? Firestore.Encoder().encode(thread)else{return}
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
    static func fetchThreads() async throws->[Thread]{
        let snapshot = try await Firestore
            .firestore()
            .collection("threads")
            .order(by: "thmestamp",descending: true)
            .getDocuments()
        return snapshot.documents.compactMap({try? $0.data(as:Thread.self)})
    }
}
