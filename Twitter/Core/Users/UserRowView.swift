//
//  UserRowView.swift
//  Twitter
//
//  Created by user242230 on 6/12/23.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing:12){
            Circle()
                .frame(width:48,height:48)
            
            VStack(alignment:.leading,spacing:4){
                Text("@coderinzler")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                Text("Lorenzo Navarro")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical,4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
