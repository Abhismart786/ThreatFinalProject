import SwiftUI

struct TabViewExample: View {
    var body: some View {
        TabView {
            // First tab: Feed
            Text("Feed View")
                .tabItem {
                    Image(systemName: "house.fill")
                    
                }

            // Second tab: Explore
            Text("Explore Content")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                   
                }

            // Third tab: Notifications
            Text("Upload Thread")
                .tabItem {
                    Image(systemName: "plus")
                    
                }

            // Fourth tab: Messages
            Text("Activity")
                .tabItem {
                    Image(systemName: "heart")
                    
                }

            // Fifth tab: Profile
            Text("Profile Content")
                .tabItem {
                    Image(systemName: "person.circle")
                    
                }
        }
        .tint(.black)
    }
}

#Preview {
    TabViewExample()
}

