//
//  RegistrationView.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2024-12-06.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject  var viewModel = RegView()
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Spacer()
            Image("threads")
                .resizable()
                .scaledToFit()
                .frame(width: 120,height: 120)
                .padding()
            VStack {
                TextField("Enter your email", text : $viewModel.email)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)
                
                SecureField("Enter your password", text: $viewModel.password)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)
                
                TextField("Enter your fullname", text : $viewModel.fullname)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)
                
                TextField("Enter your username", text : $viewModel.username)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)
            }
            Button{
                Task{
                    try await viewModel.createUser()
                }
            }label: {
                Text("Sign up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 332,height: 44)
                    .background(.black)
                    .cornerRadius(8)
            }
            .padding(.vertical)
            Spacer()
            Divider()
            Button{
                dismiss()
            }label: {
                HStack{
                    Text("Already have an account? ")
                    Text("Sign in")
                        .fontWeight(.black)
                }
                .foregroundColor(.black)
                .font(.footnote)
            }
        }
    }
}

#Preview {
    RegistrationView()
}
class RegView: ObservableObject{
    
    @Published var email = ""
    @Published  var password = ""
    @Published  var fullname = ""
    @Published var username = ""
    @MainActor
    func createUser() async throws{
        try await AuthService.shared.createUser(withEmail: email, password: password, fullname: fullname, username: username)
    }
}
