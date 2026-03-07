import SwiftUI

public protocol Routable {
    associatedtype Body: View

    @ViewBuilder
    static func resolve(route: Route) -> Body
}
