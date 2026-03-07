import Foundation

public enum Route: Hashable {

    // MARK: - Chats

    case chatList
    case conversation(id: String)
    case newChat

    // MARK: - Auth

    case login
    case register

    // MARK: - Onboarding

    case landing
}
