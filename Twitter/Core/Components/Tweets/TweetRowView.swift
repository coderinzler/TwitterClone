//
//  TweetRowView.swift
//  Twitter
//
//  Created by user242230 on 6/11/23.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading){
            // Profile image + user info + tweets
            HStack(alignment: .top,spacing:12){
                Circle()
                    .frame(width: 56,height:56)
                    .foregroundColor(Color(.systemBlue))
                
                // User information and tweet caption
                VStack(alignment: .leading, spacing: 4){
                    
                    //User info
                    HStack{
                        Text("Lorenzo Navarro")
                            .font(.subheadline).bold()
                        Text("@coderinzler")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    //Tweet caption
                    Text("Make America great again!")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            
            HStack{
                Button{
                    //action goes here
                } label:{
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button{
                    // action goes here
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button{
                    // action goes here
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                    
                }
                
                Spacer()
                
                Button{
                    //action goes here
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }.padding()
                .foregroundColor(.gray)
            
            Divider()
        }
        .padding()
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
