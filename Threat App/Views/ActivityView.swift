//
//  ActivityView.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2024-12-09.
//

import SwiftUI

struct ActivityView: View {
    
    // Sample data model for activities
    struct Activity: Identifiable {
        var id = UUID()
        var type: ActivityType
        var description: String
        var timestamp: Date
    }
    
    enum ActivityType: String {
        case post = "Post"
        case comment = "Comment"
        case like = "Like"
        case follow = "Follow"
    }
    
    // Sample activity data
    @State private var activities: [Activity] = [
        Activity(type: .post, description: "You posted a new update.", timestamp: Date().addingTimeInterval(-3600)),
        Activity(type: .comment, description: "You commented on a post.", timestamp: Date().addingTimeInterval(-7200)),
        Activity(type: .like, description: "You liked a photo.", timestamp: Date().addingTimeInterval(-10800)),
        Activity(type: .follow, description: "You followed Shubham.", timestamp: Date().addingTimeInterval(-14400)),
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Your Activity")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                
                List(activities.sorted(by: { $0.timestamp > $1.timestamp })) { activity in
                    HStack {
                        Image(systemName: getActivityIcon(for: activity.type))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.black)
                        
                        VStack(alignment: .leading) {
                            Text(activity.description)
                                .font(.body)
                            
                            Text("\(activity.timestamp, formatter: activityDateFormatter)")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 8)
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarTitle("Activity", displayMode: .inline)
        }
    }
    
    // Function to return the icon based on activity type
    func getActivityIcon(for type: ActivityType) -> String {
        switch type {
        case .post: return "square.and.pencil"
        case .comment: return "bubble.left.and.bubble.right.fill"
        case .like: return "heart.fill"
        case .follow: return "person.fill.checkmark"
        }
    }
    
    // Date Formatter for timestamps
    private var activityDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
}

#Preview {
    ActivityView()
}
