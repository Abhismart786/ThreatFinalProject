//
//  FeedView.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2024-12-09.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                LazyVStack{
                    ForEach(0 ... 10, id:\.self){_ in 
                        VStack{
                            HStack(alignment: .top, spacing: 12){
                                Image(systemName: "person.circle")
                                    .scaleEffect(2)
                                    .frame(width: 30,height:30)
                                    .imageScale(.large)
                                    .clipShape(Circle())
                                VStack(alignment: .leading, spacing: 4)
                                {
                                    HStack{
                                        Text("Abhishek")
                                            .font(.caption)
                                            .fontWeight(.semibold)
                                        
                                        Spacer()
                                        
                                        Button{
                                            
                                        }label: {
                                            Image(systemName: "ellipsis")
                                                .foregroundColor(Color(.darkGray))
                                        }
                                    }
                                    Text("You are the best")
                                        .font(.footnote)
                                        .multilineTextAlignment(.leading)
                                    
                                    HStack(spacing: 16)
                                    {
                                        Button{
                                            
                                        }label: {
                                            Image(systemName: "heart")
                                        }
                                        Button{
                                            
                                        }label: {
                                            Image(systemName: "bubble.right")
                                        }
                                        Button{
                                            
                                        }label: {
                                            Image(systemName: "arrow.rectanglepath")
                                        }
                                        Button{
                                            
                                        }label: {
                                            Image(systemName: "paperplane")
                                        }
                                    }
                                    .foregroundColor(.black)
                                    .padding(.vertical,8)
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
}

#Preview {
    FeedView()
}
