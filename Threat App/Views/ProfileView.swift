//
//  ProfileView.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2024-12-09.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: ProfileThread = .threads
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                VStack(spacing: 20){
                    HStack(alignment: .top)
                    {
                        VStack(alignment: .leading, spacing: 12)
                        {
                            VStack(alignment: .leading, spacing: 4)
                            {
                                Text("  Abhishek Sehgal")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text("   abhishek_sehgal")
                                    .font(.subheadline)
                            }
                            
                            Text("    Never Give up!")
                                .font(.footnote)
            
                            Text("    10 followers")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                        }
                        
                        Spacer()
                        Image(systemName: "person.circle")
                            .scaleEffect(2)
                            .frame(width: 30,height:40)
                            .imageScale(.large)
                            .clipShape(Circle())
                    }.padding(6)
                    
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
                    VStack{
                        HStack{
                            ForEach(ProfileThread.allCases){
                                filter in
                                VStack{
                                    Text(filter.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedFilter == filter ? .semibold: .regular)
                                    if selectedFilter == filter{
                                        Rectangle()
                                            .foregroundColor(.black)
                                            .frame(width:180,height: 1)
                                    }
                                    else{
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: 180,height:1)
                                    }
                                }
                                .onTapGesture {
                                    withAnimation(.spring()){
                                        selectedFilter = filter
                                    }
                                }
                            }
                        }
                        LazyVStack{
                            ForEach(0 ... 10, id:\.self){_ in
                                VStack{
                                    HStack(alignment: .top, spacing: 12){
                                        Image(systemName: "person.circle")
                                            .scaleEffect(2)
                                            .frame(width: 30,height:30)
                                            .imageScale(.large)
                                            .clipShape(Circle())
                                        VStack(alignment: .leading, spacing: 4)
                                        {
                                            HStack{
                                                Text("Abhishek")
                                                    .font(.caption)
                                                    .fontWeight(.semibold)
                                                
                                                Spacer()
                                                
                                                Button{
                                                    
                                                }label: {
                                                    Image(systemName: "ellipsis")
                                                        .foregroundColor(Color(.darkGray))
                                                }
                                            }
                                            Text("You are the best")
                                                .font(.footnote)
                                                .multilineTextAlignment(.leading)
                                            
                                            HStack(spacing: 16)
                                            {
                                                Button{
                                                    
                                                }label: {
                                                    Image(systemName: "heart")
                                                }
                                                Button{
                                                    
                                                }label: {
                                                    Image(systemName: "bubble.right")
                                                }
                                                Button{
                                                    
                                                }label: {
                                                    Image(systemName: "arrow.rectanglepath")
                                                }
                                                Button{
                                                    
                                                }label: {
                                                    Image(systemName: "paperplane")
                                                }
                                            }
                                            .foregroundColor(.black)
                                            .padding(.vertical,8)
                                        }
                                    }
                                    Divider()
                                }
                                .padding()
                            }
                        }
                    }
                }.toolbar{
                    ToolbarItem(placement:.navigationBarTrailing){
                        Button{
                            AuthService.shared.signOut()
                        }label:{
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.black)
                        }
                    }
                }
                
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView()
}
