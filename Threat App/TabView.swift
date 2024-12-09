import SwiftUI

struct TabViewExample: View {
    var body: some View {
        TabView {
            // First tab: Feed
            FeedView()
                .tabItem {
                    Image(systemName: "house.fill")
                    
                }

            // Second tab: Explore
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                   
                }

            // Third tab: Notifications
            CreateThreadView()
                .tabItem {
                    Image(systemName: "plus")
                    
                }

            // Fourth tab: Messages
            ActivityView()
                .tabItem {
                    Image(systemName: "heart")
                    
                }

            // Fifth tab: Profile
            ProfileView()
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

