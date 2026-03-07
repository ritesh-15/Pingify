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

    @StateObject private var router = AppRouter()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
        }
    }
}
