import Foundation

public enum AuthState: Equatable {
    case unauthenticated
    case authenticated
    case loading            // splash / checking token
}
