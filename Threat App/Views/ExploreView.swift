//
//  ExploreView.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2024-12-09.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(0 ... 10, id: \.self)
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
                                    Text("Abhishek")
                                        .fontWeight(.semibold)
                                    
                                    Text("Max Verstappen")
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
