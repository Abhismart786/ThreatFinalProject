import SwiftUI
import os.log



struct CreateThreadView: View {
    @StateObject var viewModel = CreateThreadViewModel()
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    private var user: User?{
        return UserService.shared.currentUser
    }
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    
                    Image(systemName: "person.circle")
                        .scaleEffect(2)
                        .frame(width: 30, height: 30)
                        .imageScale(.large)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Hello World")
                            .fontWeight(.semibold)
                        
                        TextField("Start a thread...", text: $caption, axis: .vertical)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    Button {
                        caption = ""
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .foregroundColor(.gray)
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        print("Cancle button pressed")
                        dismiss() // Dismiss the current view
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                        Task {try await viewModel.uploadThread(caption: caption)
                        dismiss()}
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    CreateThreadView()
}

