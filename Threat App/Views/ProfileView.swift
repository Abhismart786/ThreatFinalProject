//
//  ProfileView.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2024-12-09.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(spacing: 20){
                HStack(alignment: .top)
                {
                    VStack(alignment: .leading, spacing: 12)
                    {
                        VStack(alignment: .leading, spacing: 4)
                        {
                            Text("Abhishek Sehgal")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text("abhishek_sehgal")
                                .font(.subheadline)
                        }
                        Text("Never Give up!")
                            .font(.footnote)
                        Text("10 followers")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Image(systemName: "person.circle")
                        .scaleEffect(2)
                        .frame(width: 30,height:40)
                        .imageScale(.large)
                        .clipShape(Circle())
                }
                Button{
                    
                }label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352,height: 32)
                        .background(.black)
                        .cornerRadius(8)
                }
            }
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView()
}
