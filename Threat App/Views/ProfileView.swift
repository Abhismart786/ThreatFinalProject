import SwiftUI
import Combine

struct ProfileView: View {
    let user: User
    @State private var selectedFilter: ProfileThread = .threads
    @State private var isFollowing = false  // Track follow status
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(spacing: 20){
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 12) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullname)
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text(user.username)
                                .font(.subheadline)
                        }
                        
                        if let bio = user.bio {
                            Text(bio).font(.footnote)
                        }
                        
                        Text("    10 followers")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                    Spacer()
                    Image(systemName: "person.circle")
                        .scaleEffect(2)
                        .frame(width: 30, height: 40)
                        .imageScale(.large)
                        .clipShape(Circle())
                }
                .padding(6)
                
                // Follow Button
                Button {
                    isFollowing.toggle() // Toggle follow state when button is pressed
                } label: {
                    Text(isFollowing ? "Following" : "Follow") // Update text based on follow state
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 32)
                        .background(isFollowing ? Color.gray : Color.black) // Change background color based on follow state
                        .cornerRadius(8)
                }
                
                VStack {
                    HStack {
                        ForEach(ProfileThread.allCases) { filter in
                            VStack {
                                Text(filter.title)
                                    .font(.subheadline)
                                    .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                if selectedFilter == filter {
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .frame(width: 180, height: 1)
                                } else {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 180, height: 1)
                                }
                            }
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedFilter = filter
                                }
                            }
                        }
                    }
                    
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
                                            Text("Abhishek")
                                                .font(.caption)
                                                .fontWeight(.semibold)
                                            
                                            Spacer()
                                            
                                            Button {
                                                
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
                                                
                                            } label: {
                                                Image(systemName: "heart")
                                            }
                                            Button {
                                                
                                            } label: {
                                                Image(systemName: "bubble.right")
                                            }
                                            Button {
                                                
                                            } label: {
                                                Image(systemName: "arrow.rectanglepath")
                                            }
                                            Button {
                                                
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
            }
        }
        .padding(.horizontal)
    }
}

let dev = Dev(user: User(id: "12345",
                         fullname: "Abhishek Sehgal",
                         email: "abhishek@domain.com",
                         username: "@abhishekrsehgal",
                         bio: "Swift enthusiast",
                         password: "password"))
struct Dev {
    let user: User
}

#Preview {
    ProfileView(user: dev.user)
}

class ProfileViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    @Published var currentUser: User?
    
    init() {
        setup()
    }
    
    private func setup() {
        UserService.shared.$currentUser.sink {
            [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
}

