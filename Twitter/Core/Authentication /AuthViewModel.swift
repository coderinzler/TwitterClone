//
//  AuthViewModel.swift
//  Twitter
//
//  Created by user244332 on 7/6/23.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    init(){
        //if user is logged in, it stored the session in the variable
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session is \(self.userSession)")
    }
}
