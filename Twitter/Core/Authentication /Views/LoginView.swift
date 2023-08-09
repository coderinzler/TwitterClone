//
//  LoginView.swift
//  Twitter
//
//  Created by user242230 on 6/21/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        //Parent container
        VStack{
            // Header view
            
            AuthHeaderView(title1: "Hello",title2: "Welcome back")
            
            VStack(spacing:40){
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                CustomInputField(imageName: "lock", placeholderText: "Password", text: $password)
            }
            .padding(.horizontal,32)
            .padding(.top,44)
            
            HStack{
                Spacer()
                NavigationLink{
                    Text("Reset Password View")
                }label: {
                    Text("Forgot password")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing,24)
                }
            }
            
            Button {
                // action goes here
                viewModel.signIn(withEmail: email, password: password)
            }label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width:340,height:50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y:0)
            
            Spacer()
            
            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
            }label:{
                HStack{
                    Text("Don't have an account?")
                        .font(.caption)
                    
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom,32)
            .foregroundColor(Color(.systemBlue))
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
