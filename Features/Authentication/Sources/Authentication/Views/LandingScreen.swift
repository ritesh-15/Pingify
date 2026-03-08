import SwiftUI
import Infra

public struct LandingScreen: View {

    @Environment(AppRouter.self) private var appRouter

    public init() {}
    
    public var body: some View {
        VStack {
            Text("Landing screen")

            Button("Go to login") {
                appRouter.navigate(to: .login)
            }
        }
    }
}

#Preview {
    LandingScreen()
}
