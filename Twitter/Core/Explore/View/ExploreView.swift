//
//  ExploreView.swift
//  Twitter
//
//  Created by user242230 on 6/12/23.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack{
                    ForEach(0 ... 25, id: \.self) { _ in
                        NavigationLink{
                            ProfileView()
                        }label:{
                            UserRowView()
                        }
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
