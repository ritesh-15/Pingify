//
//  ContentView.swift
//  Pingify
//
//  Created by Ritesh Khore on 07/03/26.
//

import SwiftUI
import Infra
import Authentication

struct ContentView: View {

    @Environment(AuthManager.self) private var authManager
    @Environment(AppRouter.self) private var appRouter

    var body: some View {
        @Bindable var router = appRouter

        switch authManager.state {
        case .authenticated:
            MainScreen()
        case .unauthenticated:
            NavigationStack(path: $router.globalPath) {
                LandingScreen()
                    .navigationDestination(for: Route.self) { route in
                        AppViewFactory.view(for: route)
                    }
            }
        case .loading:
            Text("Splash screen loading...")
        }
    }
}

#Preview {
    ContentView()
}
