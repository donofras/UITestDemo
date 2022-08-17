//
//  TestDemoApp.swift
//  TestDemo
//
//  Created by Denis Onofras on 17.08.22.
//

import SwiftUI

@main
struct TestDemoApp: App {
    
    var user = UserModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(user)
        }
    }
}
