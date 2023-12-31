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
    var body: some View {
        
        //parent container
        VStack{
            AuthHeaderView(title1: "Hello.",title2: "Welcome Back")
            
            VStack(spacing:40){
                CustomInputField(imageName: "envelope",
                placeholderText: "Email",text: $email)
                
                CustomInputField(imageName: "lock", placeholderText: "Password", text: $password)
            }
            .padding(.horizontal,32)
            .padding(.top,44)
            
            HStack{
                Spacer()
                
                NavigationLink{
                    Text("Reset password view")
                }label:{
                    Text("Forgot password?")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing,24)
                }
            }
            
            Button{
                // action goes here
            }label:{
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width:340,height:50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10,x:0,y:0)
            
            Spacer()
            
            NavigationLink{
                RegistrationView()
                    .navigationBarHidden(true)
            }label:{
                HStack{
                    Text("Don't have an account?")
                        .font(.footnote)
                    
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
