//
//  ContentView.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2024-12-06.
//

import SwiftUI
import Combine
import FirebaseAuth
import MapKit
import CoreLocation
struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @State private var showMapView = false  // State to control map view display
    
    var body: some View {
        VStack {
            if let userSession = viewModel.userSession {
                // Show the TabView if the user is logged in
                TabViewExample()
                Button(action: {
                    showMapView.toggle()  // Toggle the state to show map
                }) {
                    Text("Show Map View")
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                .fullScreenCover(isPresented: $showMapView) {
                    // Present the MapView when the button is pressed
                    MapViewController()  // This is the view that contains the map API logic
                }
            } else {
                // Show LoginView if not logged in
                LoginView()
            }
            
            // Button to show the Map View
           
        }
        .onAppear {
            // Do any initialization when the ContentView appears
        }
    }
}

#Preview {
    ContentView()
}
import Foundation
class ContentViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    init(){
        setupSubscribers()
    }
    private func setupSubscribers(){
        AuthService.shared.$userSession.sink {
            [weak self] userSession in self?.userSession = userSession
        }.store(in: &cancellables)
    }
}
