//
//  EditProfileView.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2024-12-27.
//

import SwiftUI

struct EditProfileView: View {
    let user: User
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom,.horizontal])
                VStack{
                    HStack{
                        VStack(alignment:.leading){
                            Text("Name")
                                .fontWeight(.semibold)
                            Text(user.fullname)
                        }
                        .font(.footnote)
                        Spacer()
                        Image(systemName: "person.circle")
                            .scaleEffect(2)
                            .frame(width: 30,height:30)
                            .imageScale(.large)
                            .clipShape(Circle())
                    }
                    Divider()
                    VStack(alignment:.leading){
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Enter your bio..",text: $bio,axis: .vertical)
                    }
                    .font(.footnote)
                    Divider()
                    VStack(alignment:.leading){
                        Text("Link")
                            .fontWeight(.semibold)
                        TextField("Enter your Link..",text: $link)
                    }
                    .font(.footnote)
                    Divider()
                    Toggle("Private profile", isOn: $isPrivateProfile)
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .padding()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }.font(.subheadline)
                        .foregroundColor(.black)
                }
                ToolbarItem(placement:.navigationBarTrailing){
                    Button("Done"){
                        Task{ try await viewModel.updateUserData()}
                        dismiss()
                    }.font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    EditProfileView(user: dev.user)
}
class EditProfileViewModel: ObservableObject{
    func updateUserData() async throws{
       
    }
}
