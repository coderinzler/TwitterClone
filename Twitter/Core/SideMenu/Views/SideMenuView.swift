//
//  SideMenuView.swift
//  Twitter
//
//  Created by user242230 on 6/12/23.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading,spacing:32){
            VStack(alignment: .leading) {
                Circle()
                    .frame(width:48,height: 48)
                
                VStack(alignment: .leading,spacing:4){
                    Text("Lorenzo Navarro")
                        .font(.headline)
                    
                    Text("@coderinzler")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                UserStatsView()
                    .padding(.vertical)
            }
            .padding(.leading)
            
            ForEach(sideMenuViewModel.allCases, id: \.rawValue) { viewModel in
                if viewModel == .profile {
                    NavigationLink {
                        ProfileView()
                    } label : {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                }else if viewModel == .logout {
                    Button {
                        authViewModel.signOut()
                    }label: {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                } else {
                    SideMenuOptionRowView(viewModel: viewModel)
                }

            }
            Spacer()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
 
