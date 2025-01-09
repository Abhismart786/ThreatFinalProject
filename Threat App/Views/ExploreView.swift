//
//  ExploreView.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2024-12-09.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    @StateObject var viewModel = ExporeViewModel()
    var body: some View {
        let users : User
        NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.users)
                    {
                        user in
                        VStack {
                            HStack{
                                Image(systemName: "person.circle")
                                    .scaleEffect(2)
                                    .frame(width: 30,height:40)
                                    .imageScale(.large)
                                    .clipShape(Circle())
                                VStack(alignment: .leading)
                                {
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    
                                    Text(user.fullname)
                                }
                                .font(.footnote)
                                Spacer()
                                Text("Follow")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .frame(width: 100,height: 32)
                            }
                        }
                        .padding(.horizontal)
                        Divider()
                    }
                    .padding(.vertical,4)
                    
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText,prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
//fetching users from database
class ExporeViewModel: ObservableObject{
    @Published var users = [User]()
    init(){
        Task {try await fetchUsers()}
    }
    @MainActor
    private func fetchUsers() async throws{
        self.users = try await UserService.fetchUsers()
    }
}
