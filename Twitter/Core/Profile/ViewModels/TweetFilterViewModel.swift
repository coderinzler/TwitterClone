//
//  TweetFilterViewModel.swift
//  Twitter
//
//  Created by user242230 on 6/12/23.
//

import Foundation

// CaseIterable let all the options become an array if you call "allCases in a ForEach loop"
enum TweetFilterViewModel: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets: return  "Tweets"
        case .replies: return "Replies"
        case .likes: return "Likes"
        }
    }
}
