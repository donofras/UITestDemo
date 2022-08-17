//
//  ContentView.swift
//  TestDemo
//
//  Created by Denis Onofras on 17.08.22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var user: UserModel
    
    @State private var showLogin: Bool = false
    @State private var showRegister: Bool = false
    
    var body: some View {
        VStack {
            Group {
                Text(!user.isLoggedIn ? "Welcome Page!" : "Welcome \(user.username)!")
                    .font(.title)
                
                Spacer()
                
                Button(action: {
                    if !user.isLoggedIn {
                        showLogin = true
                    } else {
                        user.logout()
                    }
                }, label: {
                    Text(!user.isLoggedIn ? "Login" : "Logout")
                }).accessibilityIdentifier("loginButton")
                
                if !user.isLoggedIn {
                    Button {
                        showRegister = true
                    } label: {
                        Text("Register")
                    }.accessibilityIdentifier("registerButton")
                }
                
                Spacer()
                
            }.padding()
            
        }
        .sheet(isPresented: $showLogin, content: { LoginView() })
        .sheet(isPresented: $showRegister, content: { RegisterView() })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserModel())
    }
}
