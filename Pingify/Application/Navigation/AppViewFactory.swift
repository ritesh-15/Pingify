import SwiftUI
import Infra

public struct AppViewFactory {

    @ViewBuilder
    public static func view(for route: Route) -> some View {
        switch route {
        case .chatList:
            Text("ChatList")
        case .conversation(let _):
            Text("Conversation")
        case .newChat:
            Text("New Chat")
        case .login:
            Text("Login")
        case .register:
            Text("Register")
        case .landing:
            Text("Landing")
        }
    }
}
