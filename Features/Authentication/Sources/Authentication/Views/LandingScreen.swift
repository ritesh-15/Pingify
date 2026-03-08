import SwiftUI
import Infra
import InfraUI

public struct LandingScreen: View {

    @Environment(AppRouter.self) private var appRouter

    public init() {}
    
    public var body: some View {
        VStack {
            Text("Landing screen")
                .font(FontFamily.Poppins.semiBold.size(24))

            Button("Go to login") {
                appRouter.navigate(to: .login)
            }
            .textStyle(.bodyS)
        }
    }
}

#Preview {
    LandingScreen()
}
