import SwiftUI
import Infra

struct MainScreen: View {

    @Environment(AppRouter.self) private var appRouter

    var body: some View {
        @Bindable var router = appRouter

        TabView(selection: $router.selectedTab) {
            Tab(AppTab.chats.title, systemImage: AppTab.chats.icon, value: AppTab.chats) {
                NavigationStack(path: router.currentPath) {
                    Text("Chats")
                        .navigationDestination(for: Route.self) { route in
                            AppViewFactory.view(for: route)
                        }
                }
            }

            Tab(AppTab.newChat.title, systemImage: AppTab.newChat.icon, value: AppTab.newChat) {
                Color.clear
            }

            Tab(AppTab.profile.title, systemImage: AppTab.profile.icon, value: AppTab.profile) {
                NavigationStack(path: router.currentPath) {
                    Text("Profile")
                        .navigationDestination(for: Route.self) { route in
                            AppViewFactory.view(for: route)
                        }
                }
            }
        }
    }
}

#Preview {
    MainScreen()
}
