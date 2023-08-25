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
    @Published var didAuthenticateUser = false
    @Published var currentUser : User?
    private var tempUserSession:  FirebaseAuth.User?
    
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    func signIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else {return}
            self.userSession = user
            print("DEBUG: Did log user in...")
        }
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
            self.tempUserSession = user
            
            print("DEBUG: Registered user successfully")
            print("DEBUG: User is \(self.userSession)")
            
            
            let data = ["email": email, "username": username.lowercased(), "fullname": fullname, "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true 
                }
        }
    }
    
    
    func signOut() {
        //sets user session to nil, to show the login
        userSession = nil
        
        //signs user out of the server
        try? Auth.auth().signOut()
    }
    
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else {return}
        
        ImageUploader.uploadImage(image:image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl":profileImageUrl]) {_ in
                    self.userSession = self.tempUserSession
                }
        }
    }
    
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else {return}
        
        service.fetchUser(withUid: uid) {user in
            self.currentUser = user
        }
    }
}
