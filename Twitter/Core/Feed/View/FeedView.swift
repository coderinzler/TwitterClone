//
//  FeedView.swift
//  Twitter
//
//  Created by user242230 on 6/11/23.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView{
                LazyVStack{
                    ForEach(0...20, id:\.self) {_ in
                        TweetRowView()
                            .padding()
                    }
                }
            }
            Button {
                // shoe the fullScreenCover
                showNewTweetView.toggle()
            }label: {
                Image("tweet-post")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width:48,height:48)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
