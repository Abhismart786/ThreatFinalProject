//
//  CreateThreadView.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2024-12-09.
//

import SwiftUI

struct CreateThreadView: View {
    @State private var caption = ""
    var body: some View {
        NavigationStack{
            VStack{
                HStack(alignment:.top){
                    Image(systemName: "person.circle")
                        .scaleEffect(2)
                        .frame(width: 30,height:30)
                        .imageScale(.large)
                        .clipShape(Circle())
                    VStack(alignment:.leading,spacing: 4)
                    {
                        Text("Hello World")
                            .fontWeight(.semibold)
                        TextField("Start a thread...",text:   $caption,axis: .vertical)
                    }.font(.footnote)
                    Spacer()
                    if !caption.isEmpty{
                        Button{
                            caption = ""
                        }label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12,height: 12)
                                .foregroundColor(.gray)
                        }
                    }
                }
                Spacer()
                
            }.padding()
            .navigationTitle("New Thread")
                .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement:.navigationBarLeading){
                    Button("Cancel"){
                        
                    }.font(.subheadline)
                        .foregroundColor(.black)
                }
                ToolbarItem(placement:.navigationBarTrailing)
                {
                    Button("Post"){
                        
                    } .font(.subheadline)
                      .fontWeight(.semibold)
                      .foregroundColor(.black)
                }
                
            }
        }
    }
}

#Preview {
    CreateThreadView()
}
