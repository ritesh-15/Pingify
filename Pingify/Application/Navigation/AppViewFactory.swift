import SwiftUI
import Infra
import Authentication

public struct AppViewFactory {

    @ViewBuilder
    public static func view(for route: Route) -> some View {
        switch route {
        case .chats:
            Text("ChatList")
        case .conversation( _):
            Text("Conversation")
        case .newChat:
            Text("New Chat")
        case .login:
            LoginScreen()
        case .register:
            RegisterationCoordinator()
        case .landing:
            LandingScreen()
        case .splash:
            Text("Splash screen")
        case .profile:
            Text("Profile")
        }
    }
}
