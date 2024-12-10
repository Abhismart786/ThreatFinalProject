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
                    
                }
            }
            .searchable(text: $searchText,prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
