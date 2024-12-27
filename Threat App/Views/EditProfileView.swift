//
//  EditProfileView.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2024-12-27.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom,.horizontal])
                VStack{
                    
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel"){
                        
                    }.font(.subheadline)
                        .foregroundColor(.black)
                }
                ToolbarItem(placement:.navigationBarTrailing){
                    Button("Done"){
                        
                    }.font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
