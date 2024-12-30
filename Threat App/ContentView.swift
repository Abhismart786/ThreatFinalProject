//
//  ContentView.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2024-12-06.
//

import SwiftUI
import Combine
import FirebaseAuth
struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                TabViewExample()
            }
            else{
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}

class ContentViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    init(){
        setupSubscribers()
    }
    private func setupSubscribers(){
        AuthService.shared.$userSession.sink {
            [weak self] userSession in self?.userSession = userSession
        }
    }
}
