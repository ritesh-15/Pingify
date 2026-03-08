import SwiftUI

@Observable
@MainActor
public final class AppRouter {

    public var selectedTab: AppTab

    private var paths: [AppTab: NavigationPath] = [
        .chats: NavigationPath(),
        .newChat: NavigationPath(),
        .profile: NavigationPath()
    ]

    public var globalPath: NavigationPath = .init()
    private(set) var presentedSheet: Route?
    private(set) var presentedFullScreen: Route?

    public init(initialTab: AppTab = .chats) {
        self.selectedTab = initialTab
    }

    // MARK: - Full screen and sheets

    public func presentFullScreen(route: Route) {
        presentedFullScreen = route
    }

    public func dismissFullScreen() {
        presentedFullScreen = nil
    }

    public func presentSheet(route: Route) {
        presentedSheet = route
    }

    public func dismissSheet() {
        presentedSheet = nil
    }

    // MARK: - Navigation

    public func navigate(to route: Route) {
        if route.isGlobal {
            globalPath.append(route)
            return
        }

        paths[selectedTab]?.append(route)
    }

    public func navigateBack() {
        paths[selectedTab]?.removeLast()
    }

    public func switchTab(to tab: AppTab) {
        selectedTab = tab
    }

    func resetAllPaths() {
        paths = [
            .chats: .init(),
            .newChat: .init(),
            .profile: .init()
        ]
        globalPath = .init()
    }

    public var currentPath: Binding<NavigationPath> {
        Binding {
            self.paths[self.selectedTab] ?? .init()
        } set: {
            self.paths[self.selectedTab] = $0
        }
    }
}
