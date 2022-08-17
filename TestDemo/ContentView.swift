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
            
            Text(!user.isLoggedIn ? "Welcome Page!" : "Welcome \(user.username)!")
                .font(.title)
            
            
            if true {
                Form {
                    Section {
                        VStack {
                            Text("Color Theme")
                            Picker("", selection: $user.colorTheme) {
                                Text("Light").tag(0)
                                Text("Dark").tag(1)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .accessibilityIdentifier("colorTheme")
                        }
                    }
                    
                    Section {
                        HStack {
                            Text("Text Size")
                            Slider(value: $user.textSize, in: 1...100)
                                .accessibilityIdentifier("slider")
                        }
                    }
                    
                    Section {
                        VStack {
                            Text("Font")
                            Picker("", selection: $user.font) {
                                Text("Arial").tag("Arial")
                                Text("Avenir Next").tag("Avenir Next")
                                Text("Noteworthy").tag("Noteworthy")
                                Text("Futura").tag("Futura")
                            }
                            .pickerStyle(WheelPickerStyle())
                            .accessibilityIdentifier("fontPicker")
                        }
                    }
                }.cornerRadius(16)
            }
            
            Button(action: {
                if !user.isLoggedIn {
                    showLogin = true
                } else {
                    user.logout()
                }
            }, label: {
                Text(!user.isLoggedIn ? "Login" : "Logout")
            })
            .padding()
            .accessibilityIdentifier("loginButton")
            
            if !user.isLoggedIn {
                Button {
                    showRegister = true
                } label: {
                    Text("Register")
                }
                .padding()
                .accessibilityIdentifier("registerButton")
            }
            
            Spacer()
            
            
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
