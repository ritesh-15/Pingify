import SwiftUI
import Combine

@MainActor
public final class AppRouter: ObservableObject {

    // MARK: - State

    @Published public var selectedTab: AppTab

    @Published private var paths: [AppTab: [Route]] = Dictionary(
        uniqueKeysWithValues: AppTab.allCases.map { ($0, []) }
    )

    // MARK: - Init

    public init(initialTab: AppTab = .chats) {
        self.selectedTab = initialTab
    }

    // MARK: - Path Binding (for NavigationStack)

    public func binding(for tab: AppTab) -> Binding<[Route]> {
        Binding(
            get: { self.paths[tab] ?? [] },
            set: { self.paths[tab] = $0 }
        )
    }

    // MARK: - Push

    /// Push onto the current tab
    public func push(_ route: Route) {
        paths[selectedTab]?.append(route)
    }

    /// Push onto a specific tab
    public func push(_ route: Route, in tab: AppTab) {
        paths[tab]?.append(route)
    }

    // MARK: - Pop

    public func pop() {
        paths[selectedTab]?.removeLast()
    }

    public func pop(in tab: AppTab) {
        guard !(paths[tab]?.isEmpty ?? true) else { return }
        paths[tab]?.removeLast()
    }

    public func popToRoot() {
        paths[selectedTab]?.removeAll()
    }

    public func popToRoot(in tab: AppTab) {
        paths[tab]?.removeAll()
    }

    // MARK: - Tab

    public func selectTab(_ tab: AppTab) {
        selectedTab = tab
    }

    /// Standard iOS UX: re-tapping active tab pops to root
    public func handleTabReselect(_ tab: AppTab) {
        guard tab == selectedTab else { return }
        popToRoot(in: tab)
    }

    // MARK: - Cross-tab

    /// Switch tab then optionally push a route
    public func navigate(to tab: AppTab, pushing route: Route? = nil) {
        selectedTab = tab
        if let route {
            push(route, in: tab)
        }
    }
}
