//
//  LoginView.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2024-12-06.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
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
                    TextField("Enter your email", text : $email)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal,24)
                    
                    SecureField("Enter your password", text: $password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal,24)
                }
            }
            .padding()
            Button{
                
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
                Text("Registration View")
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
