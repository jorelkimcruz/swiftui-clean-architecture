//
//  DependencyInjectionResolver.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//

import Foundation

class DependencyInjectionResolver {
    static let shared = DependencyInjectionResolver()

    // get the IOC container
    private var container = DependencyInjectionInitializer.shared.container

    func resolve<T>(_: T.Type) -> T {
        container.resolve(T.self)!
    }
}

@propertyWrapper
struct Inject<I> {
    let wrappedValue: I

    init() {
        // Resolve the interface to an implementation.
        wrappedValue = DependencyInjectionResolver.shared.resolve(I.self)
    }
}
