//
//  TwitterClone.swift
//  Twitter
//
//  Created by user246207 on 8/9/23.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    
    init() {
        self.userSession = Auth.auth().currentUser
        //print("DEBUG: User session is: \(self.userSession)")
    }
    
    func signIn(withEmail email: String, password: String) {
        print("DEBUG: Signed In with email \(email)")
    }
    
    func signUp(withEmail email: String, password: String, fullname: String, username: String) {
        print("DEBUG: Signed Up with email \(email)")
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                // returns localized error
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            self.userSession = user
            
            print("DEBUG: Registered user successfully")
            print("DEBUG: User is \(self.userSession)")
            
            
            let data = ["email": email, "username": username.lowercased(), "fullname": fullname, "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    print("DEBUG: Did upload user data")
                }
        }
    }
    
    
    func signOut() {
        //sets user session to nil, to show the login
        userSession = nil
        
        //signs user out of the server
        try? Auth.auth().signOut()
    }
}
