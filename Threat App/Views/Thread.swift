//
//  Thread.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2025-01-10.
//

import Firebase
import Foundation
struct Thread: Identifiable,Codable{
    let id: String
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    var user: User?
}
class CreateThreadViewModel: ObservableObject{
    
}
struct ThreadService{
    static func uploadThread(_ thread: Thread) async throws{
        guard let threadData = try? Firestore.Encoder().encode(thread)else{return}
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
}
