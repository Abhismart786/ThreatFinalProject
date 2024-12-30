//
//  LoginView.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2024-12-06.
//

import SwiftUI

struct LoginView: View {
    
    @State var viewModel = LogView()
    @State private var isLoginSuccessful = false
    var body: some View {
        
        NavigationStack{
            Spacer()
            VStack{
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
                }
            }
            .padding()
            Button{
                Task {
                    do {
                        try await viewModel.login()
                        isLoginSuccessful = true
                        } catch {
                            print("Login failed: \(error)")
                                }
                        }
            }label: {
                Text("Login")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 302,height: 44)
                    .background(.black)
                    .cornerRadius(8)
                    
            }
            Spacer()
            Divider()
            NavigationLink{
                RegistrationView()
                    .navigationBarBackButtonHidden(true)
            }label: {
                HStack{
                    Text("Don't have an account? ")
                    Text("Sign Up")
                        .fontWeight(.black)
                }
                .foregroundColor(.black)
                .font(.footnote)
            }
            .padding(.vertical,16)
        }
    }
}

#Preview {
    LoginView()
}
class LogView: ObservableObject{
    
    @Published var email = ""
    @Published  var password = ""
    
    @MainActor
    func login() async throws{
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
