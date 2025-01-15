import FirebaseAuth
import FirebaseFirestore

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?  // used to check if the user is logged in or not
    static let shared = AuthService()//shared is used to use make keyword globally to use in the project
    // constructor used to check the authorization
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    // Login method
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
        } catch {
            print("DEBUG Failed to login: \(error.localizedDescription)")
        }
    }
    
    // Create a new user
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: Created user \(result.user.uid)")
            try await uploadUserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid, password: password)
        } catch {
            print("DEBUG Failed to create user: \(error.localizedDescription)")
        }
    }
    
    // Sign out method
    func signOut() {
        try? Auth.auth().signOut()  // Sign out from Firebase
        self.userSession = nil  // Remove the current user session
        UserService.shared.reset()  // Reset the current user in the UserService
    }
    
    // Upload user data to Firestore
    @MainActor
    private func uploadUserData(withEmail email: String, fullname: String, username: String, id: String, password: String) async throws {
        let user = User(id: id, fullname: fullname, email: email, username: username, password: password)
        guard let userData = try? Firestore.Encoder().encode(user) else {
            return
        }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
    
    // Send password reset email
    @MainActor
    func sendPasswordReset(toEmail email: String) async throws {
        do {
            try await Auth.auth().sendPasswordReset(withEmail: email)
        } catch {
            throw error  // Pass any error that occurs during the reset process
        }
    }
}

