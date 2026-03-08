//
//  PingifyApp.swift
//  Pingify
//
//  Created by Ritesh Khore on 07/03/26.
//

import SwiftUI
import Infra

@main
struct PingifyApp: App {

    @State private var router = AppRouter()
    @State private var authManager = AuthManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(router)
                .environment(authManager)
        }
    }
}
