//
//  UserModel.swift
//  TestDemo
//
//  Created by Denis Onofras on 17.08.22.
//

import Foundation

class UserModel: ObservableObject {
    @Published var isLoggedIn = false
    @Published var username = ""
    @Published var password = ""
 
    func login() -> Bool {
        guard username == "test" && password == "pass" else {
            return false
        }
 
        password = ""
        isLoggedIn = true
        return true
    }
    
    func logout() {
        isLoggedIn = false
        username = ""
    }
}
