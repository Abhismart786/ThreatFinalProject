import SwiftUI

struct FeedView: View {
    let user: User
    @State private var isLiked = false // Track if the post is liked
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(0 ... 10, id: \.self) { _ in
                        VStack {
                            HStack(alignment: .top, spacing: 12) {
                                Image(systemName: "person.circle")
                                    .scaleEffect(2)
                                    .frame(width: 30, height: 30)
                                    .imageScale(.large)
                                    .clipShape(Circle())
                                VStack(alignment: .leading, spacing: 4) {
                                    HStack {
                                        Text(user.fullname)
                                            .font(.caption)
                                            .fontWeight(.semibold)
                                        
                                        Spacer()
                                        
                                        Button {
                                            // Add action for ellipsis if needed
                                        } label: {
                                            Image(systemName: "ellipsis")
                                                .foregroundColor(Color(.darkGray))
                                        }
                                    }
                                    Text("You are the best")
                                        .font(.footnote)
                                        .multilineTextAlignment(.leading)
                                    
                                    HStack(spacing: 16) {
                                        Button {
                                            // Toggle the liked status when the heart is clicked
                                            isLiked.toggle()
                                        } label: {
                                            // Set the heart icon color based on the like status
                                            Image(systemName: isLiked ? "heart.fill" : "heart")
                                                .foregroundColor(isLiked ? .red : .black)
                                        }
                                        
                                        Button {
                                            // Add action for the comment button
                                        } label: {
                                            Image(systemName: "bubble.right")
                                        }
                                        
                                        Button {
                                            // Add action for the arrow button
                                        } label: {
                                            Image(systemName: "arrow.rectanglepath")
                                        }
                                        
                                        Button {
                                            // Add action for the paperplane button
                                        } label: {
                                            Image(systemName: "paperplane")
                                        }
                                    }
                                    .foregroundColor(.black)
                                    .padding(.vertical, 8)
                                }
                            }
                            Divider()
                        }
                        .padding()
                    }
                }
            }
            .refreshable {
                // Add refresh logic if needed
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FeedView(user: dev.user)
}

