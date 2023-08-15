//
//  ProfilePhotoSelectorView.swift
//  Twitter
//
//  Created by user246207 on 8/10/23.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    var body: some View {
        VStack{
            AuthHeaderView(title1: "Create your account", title2: "Add a profile photo")
            
            Button {
                showImagePicker.toggle()
            }label:{
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                    
                }else {
                    Image("add-photo")
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.top,44)
            
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    
    func loadImage() {
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)
    }
}


private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemBlue))
            .scaledToFill()
            .frame(width:180,height:180)
            .clipShape(Circle())
        
    }
}


struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
