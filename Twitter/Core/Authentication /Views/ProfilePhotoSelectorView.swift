//
//  ProfilePhotoSelectorView.swift
//  Twitter
//
//  Created by user246207 on 8/10/23.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    var body: some View {
        VStack{
            AuthHeaderView(title1: "Create your account", title2: "Add a profile photo")
            
            Button {
                print("Pick image here...")
            }label:{
                Image("add-photo")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(Color(.systemBlue))
                    .frame(width:180,height: 180)
                    .padding(.top,44)
            }
            
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
