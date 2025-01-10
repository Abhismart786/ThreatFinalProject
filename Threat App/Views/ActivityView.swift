import SwiftUI

struct ActivityView: View {
    
    // Step 1: Sample data model for activities
    struct Activity: Identifiable {
        var id = UUID()  // Unique identifier for each activity
        var description: String // Description of the activity
    }
    
    // Step 2: Sample activity data (could be static or dynamic from a server)
    let activities: [Activity] = [
        Activity(description: "You posted a new update."),
        Activity(description: "You commented on a post."),
        Activity(description: "You liked a photo."),
        Activity(description: "You followed Shubham."),
    ]
    
    var body: some View {
        // Step 3: Create a simple List to display activities
        NavigationStack {
            VStack {
                // Title for the Activity View
                Text("Your Activity")
                    .font(.title2) // Set font size for title
                    .fontWeight(.bold) // Make title bold
                    .padding() // Add padding around the title
                
                // List to show each activity's description
                List(activities) { activity in
                    Text(activity.description)
                        .font(.body) // Set font size for description
                }
            }
            .navigationBarTitle("Activity", displayMode: .inline) // Set the title of the screen in the navigation bar
        }
    }
}

#Preview {
    ActivityView()
}

