//
//  RegisterView.swift
//  TestDemo
//
//  Created by Denis Onofras on 17.08.22.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject private var user: UserModel
    
    var body: some View {
        NavigationView {
                Form {
                    Section {
                        TextField("Username", text: $user.username)
                        SecureField("Password", text: $user.password)
                        SecureField("Confirm Password", text: $user.password)
                    }

                    Button {
                        if user.login() {
                            presentationMode.wrappedValue.dismiss()
                        }
                    } label: {
                        Text("Register")
                    }
                    .accessibilityIdentifier("registerNowButton")
                }
                .navigationTitle(Text("Register"))
                .navigationBarItems(trailing: Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark.circle")
                        .accessibilityLabel("Dismiss")
                })
            }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserModel())
    }
}
