import Foundation

public enum Route: Hashable {

    // MARK: - Chats

    case chats
    case conversation(id: String)
    case newChat

    // MARK: - Profile

    case profile

    // MARK: - Onboarding and signup

    case login
    case register

    var isGlobal: Bool {
        switch self {
        case .login, .register:
            return true
        default:
            return false
        }
    }
}
