//
//  Router.swift
//  Ami koi
//
//  Created by Rezaul Islam on 21/1/25.
//

import SwiftUI

public final class Router: ObservableObject {
    @Published public var navPath = NavigationPath()
    @Published public var presentedSheet: AnyIdentifiable?
    @Published public var args : [String : Any] = [:]

    public init() {}

    public func presentSheet(destination: any Identifiable) {
        presentedSheet = AnyIdentifiable(destination: destination)
    }

    public func navigate(to destination: any Hashable) {
        navPath.append(destination)
    }

    public func navigateBack() {
        guard !navPath.isEmpty else { return }
        navPath.removeLast()
    }

    public func navigateToRoot() {
        guard !navPath.isEmpty else { return }
        navPath.removeLast(navPath.count)
    }

    public func dismissSheet() {
        presentedSheet = nil
    }
}


public class AnyIdentifiable: Identifiable {
    public let destination: any Identifiable

    public init(destination: any Identifiable) {
        self.destination = destination
    }
}
