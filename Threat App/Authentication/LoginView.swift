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
            VStack{
                TextField("Enter your email", text : $email)
                SecureField("Enter your password", text: $password)
            }
            Button{
                
            }label: {
                Text("Login")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 352,height: 44)
                    .cornerRadius(8)
                    .background(.black)
            }
        }
    }
}

#Preview {
    LoginView()
}
