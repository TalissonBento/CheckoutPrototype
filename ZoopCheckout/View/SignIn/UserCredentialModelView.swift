//
//  UserCredentialModelView.swift
//  ZoopCheckout
//
//  Created by Talisson Bento on 14/12/20.
//

import Foundation
import SwiftUI

class SignInModelView : ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    
    init() {
        
    }
    
    func SignIn() {
        let userCredential = UserCredential(username: self.username,
                                            password: self.password)
        //TODO send userCredential to user service
    }
    
    func SignOut() {
        //TODO send sign out action to user service
    }
}
