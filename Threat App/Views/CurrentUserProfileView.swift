//
//  CurrentUserProfileView.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2025-01-09.
//

import SwiftUI
import Combine

struct CurrentUserProfileView: View {
   
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var selectedFilter: ProfileThread = .threads
    @State private var showEditProfile = false
    
    private var currentUser: User?{
        return viewModel.currentUser
    }
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
                                Text(currentUser?.fullname ?? "")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text(currentUser?.username ?? "")
                                    .font(.subheadline)
                            }
                            
                            if let bio = currentUser?.bio{
                                Text(bio).font(.footnote)
                            }
                                
                            Text("    10 followers")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                        }
                        .padding(.horizontal)
                        Spacer()
                        Image(systemName: "person.circle")
                            .scaleEffect(2)
                            .frame(width: 30,height:40)
                            .imageScale(.large)
                            .clipShape(Circle())
                    }.padding(6)
                    
                    Button{
                        showEditProfile.toggle()
                    }label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .frame(width: 352,height: 32)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay{
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray4),lineWidth: 1)
                            }
                    }
                    .sheet(isPresented: $showEditProfile, content:{ EditProfileView()})
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
    }
}

#Preview {
    CurrentUserProfileView()
}
class CurrentUserProfileViewModel: ObservableObject{
    private var cancellables = Set<AnyCancellable>()
    
    @Published var currentUser: User?
    init(){
        setup()
    }
    private func setup(){
        UserService.shared.$currentUser.sink{
            [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
}
