import SwiftUI
import Combine

public final class AppRouter: ObservableObject {
    
    @Published public var path = NavigationPath()
    
    public init() {}
    
    public func push(_ route: AppRoute) {
        path.append(route)
    }
    
    public func pop() {
        path.removeLast()
    }
    
    public func popToRoot() {
        path.removeLast(path.count)
    }
}
