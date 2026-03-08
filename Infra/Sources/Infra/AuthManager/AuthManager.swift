import Foundation
import Combine

@Observable
public final class AuthManager {

    public var state: AuthState = .unauthenticated

    public init() {}

    // MARK: - Public

    public func checkSession() async {
        // check keychain / token validity
        let hasToken = await validateStoredToken()
        state = hasToken ? .authenticated : .unauthenticated
    }

    public func signIn() {
        state = .authenticated
    }

    public func signOut() {
        state = .unauthenticated
    }

    // MARK: - Private

    private func validateStoredToken() async -> Bool {
        // TODO: replace with your real token check
        try? await Task.sleep(for: .seconds(1))
        return false
    }
}
