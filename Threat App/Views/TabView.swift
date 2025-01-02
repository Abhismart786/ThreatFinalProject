import SwiftUI
import MapKit
struct TabViewExample: View {
    @State private var showCreateThreadView = false
    @State private var coordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
    @State private var address: String = "" 
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection:$selectedTab){
            // First tab: Feed
            FeedView()
                .tabItem {
                    Image(systemName:selectedTab == 0 ? "house.fill" : "house")
                    
                }

            // Second tab: Explore
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                   
                }
                .onAppear{selectedTab = 1}

            // Third tab: Notifications
            CreateThreadView()
                .tabItem {
                    Image(systemName: "plus")
                    
                }.onChange(of: selectedTab, perform: {
                    newValue in showCreateThreadView = selectedTab == 2
                }).sheet(isPresented: $showCreateThreadView, onDismiss: {
                    selectedTab = 0
                },content:{
                    CreateThreadView()
                })
                .onAppear{selectedTab = 2}
            // Fourth tab: Messages
            ActivityView()
                .tabItem {
                    Image(systemName: "heart")
                    
                }
                .onAppear{selectedTab = 3}

            // Fifth tab: Profile
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    
                }
                .onAppear{selectedTab = 4}
           
        }
        .tint(.black)
    }
}

#Preview {
    TabViewExample()
}

