import SwiftUI
import Firebase
import FirebaseAuth
struct EditProfileView: View {
    let user: User
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    @State private var showAlert = false // To trigger the alert
    @State private var alertMessage = "" // Message to show in the alert
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            Text(user.fullname)
                        }
                        .font(.footnote)
                        Spacer()
                        
                        Image(systemName: "person.circle")
                            .scaleEffect(2)
                            .frame(width: 30, height: 30)
                            .imageScale(.large)
                            .clipShape(Circle())
                    }
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Enter your bio..", text: $bio, axis: .vertical)
                            .padding(.vertical, 5)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .padding(.bottom, 10)
                    }
                    .font(.footnote)
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        TextField("Enter your Link..", text: $link)
                            .padding(.vertical, 5)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .padding(.bottom, 10)
                    }
                    .font(.footnote)
                    Divider()
                    
                    Toggle("Private profile", isOn: $isPrivateProfile)
                        .padding(.bottom, 10)
                    
                    Spacer()
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .padding()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        Task {
                            do {
                                try await viewModel.updateUserData(bio: bio, link: link, isPrivateProfile: isPrivateProfile)
                                alertMessage = "Profile updated successfully!"
                                showAlert = true
                            } catch {
                                alertMessage = "Error updating profile: \(error.localizedDescription)"
                                showAlert = true
                            }
                        }
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Update Status"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        .onAppear {
            // Optionally pre-fill the fields with existing data
            bio = user.bio ?? ""  // Assuming user.bio is an optional field
            link = user.link ?? ""  // Assuming user.link is an optional field
            
        }
    }
}

#Preview {
    EditProfileView(user: dev.user)
}

class EditProfileViewModel: ObservableObject {
    private var db = Firestore.firestore() // Firestore instance
    private var auth = Auth.auth() // Firebase authentication
    
    func updateUserData(bio: String, link: String, isPrivateProfile: Bool) async throws {
        guard let user = auth.currentUser else {
            throw NSError(domain: "No user logged in", code: 0, userInfo: nil)
        }
        
        // Reference to the user's document in Firestore
        let userRef = db.collection("users").document(user.uid)
        
        // Create the data to update
        let updatedData: [String: Any] = [
            "bio": bio,
            "link": link,
            "isPrivateProfile": isPrivateProfile
        ]
        
        // Update the user document
        try await userRef.setData(updatedData, merge: true)
    }
}

