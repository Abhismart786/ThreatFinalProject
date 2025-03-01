import SwiftUI
import FirebaseAuth
struct ForgotPasswordView: View {
    
    @State private var email = ""
    @State private var resetStatusMessage = ""
    @State private var isSuccess = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Spacer()
            
            Image("threads")  // Assuming you have an image named "threads"
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            Text("Reset your password")
                .font(.headline)
                .padding()
            
            VStack {
                TextField("Enter your email", text: $email)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                
                if !resetStatusMessage.isEmpty {
                    Text(resetStatusMessage)
                        .foregroundColor(isSuccess ? .green : .red)
                        .padding(.top, 8)
                }
            }
            
            Button {
                Task {
                    await resetPassword()
                }
            } label: {
                Text("Send Reset Link")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 332, height: 44)
                    .background(.black)
                    .cornerRadius(8)
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
        }
       
       
        
        .navigationTitle("Forget Password")
        .navigationBarItems(leading: Button(action: {
            dismiss()  // Dismiss the view when back button is tapped
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)// Back arrow icon
                Text("Back")
                    .foregroundColor(.black)// Text for the back button
            }
        })
        
        
    }
    
    private func resetPassword() async {
        guard !email.isEmpty else {
            resetStatusMessage = "Please enter your email address."
            isSuccess = false
            return
        }
        
        do {
            try await Auth.auth().sendPasswordReset(withEmail: email)
            resetStatusMessage = "Password reset email sent!"
            isSuccess = true
        } catch {
            resetStatusMessage = "Failed to send password reset email: \(error.localizedDescription)"
            isSuccess = false
        }
        
    }
}

#Preview {
    ForgotPasswordView()
}

