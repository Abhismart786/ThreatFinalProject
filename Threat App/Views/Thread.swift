

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
    // function used to generate unique id
    var id:String{
        return threadId ?? NSUUID().uuidString
    }
    var user: User?
}
// Service class responsible for interacting with Firestore to upload threads
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
    
}
