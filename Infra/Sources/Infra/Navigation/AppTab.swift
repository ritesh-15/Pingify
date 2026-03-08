import Foundation

public enum AppTab: Hashable, CaseIterable, Equatable {
    case chats
    case newChat
    case profile

    public var title: String {
        switch self {
        case .chats:    return "Chats"
        case .newChat:  return "New Chat"
        case .profile:  return "Profile"
        }
    }

    public var icon: String {
        switch self {
        case .chats:    return "message.fill"
        case .newChat:  return "plus"
        case .profile:  return "person.fill"
        }
    }
}
