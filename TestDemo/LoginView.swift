//
//  LoginView.swift
//  TestDemo
//
//  Created by Denis Onofras on 17.08.22.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject private var user: UserModel
    @State private var showAlert: Bool = false
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Username", text: $user.username)
                    SecureField("Password", text: $user.password)
                }
                
                Button {
                    if user.login() {
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        showAlert = true
                    }
                } label: {
                    Text("Login")
                }
                .accessibilityIdentifier("loginNowButton")
            }
            .navigationTitle(Text("Login"))
            .navigationBarItems(trailing: Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark.circle")
                    .accessibilityLabel("Dismiss")
            })
        }.alert(isPresented: $showAlert) {
            Alert(title: Text("Login Failed"),
                  message: Text("Either username or password is missing, or they are wrong."),
                  dismissButton: Alert.Button.default(Text("OK"), action: {
                showAlert = false
            }))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserModel())
    }
}
