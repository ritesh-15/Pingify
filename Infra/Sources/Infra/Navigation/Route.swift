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
    case landing
    case splash

    var isGlobal: Bool {
        switch self {
        case .login, .register, .landing, .splash:
            return true
        default:
            return false
        }
    }
}
