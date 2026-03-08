import SwiftUI
import Infra
import InfraUI

public struct PreviewContainer<Content: View>: View {
    @ViewBuilder let content: () -> Content

    public init(@ViewBuilder content: @escaping () -> Content) {
        FontFamily.registerFonts()
        self.content = content
    }

    public var body: some View {
        content()
            .withAppTheme()
            .environment(AppRouter())
    }
}
