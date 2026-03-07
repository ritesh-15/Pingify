//
//  ContentView.swift
//  Pingify
//
//  Created by Ritesh Khore on 07/03/26.
//

import SwiftUI
import Infra

struct ContentView: View {

    @EnvironmentObject private var appRouter: AppRouter

    var body: some View {
        TabView {
            Tab(AppTab.chats.title, systemImage: AppTab.chats.icon) {
                NavigationStack(path: appRouter.binding(for: .chats)) {
                    Text("ChatList")
                        .navigationDestination(for: Route.self) { route in
                            AppViewFactory.view(for: route)
                        }
                }
            }

            Tab(AppTab.newChat.title, systemImage: AppTab.newChat.icon) {
                NavigationStack(path: appRouter.binding(for: .chats)) {
                    Text("New Chat")
                        .navigationDestination(for: Route.self) { route in
                            AppViewFactory.view(for: route)
                        }
                }
            }

            Tab(AppTab.profile.title, systemImage: AppTab.profile.icon) {
                NavigationStack(path: appRouter.binding(for: .chats)) {
                    Text("Chats")
                        .navigationDestination(for: Route.self) { route in
                            AppViewFactory.view(for: route)
                        }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
