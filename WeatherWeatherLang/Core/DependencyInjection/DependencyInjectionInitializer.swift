//
//  DependencyInjection+Initializer.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//

import Swinject

extension Container {
    static let shared = Container()
}

final class DependencyInjectionInitializer {
    static let shared = DependencyInjectionInitializer()
    let container = Container.shared

    init() {
        initApi()
        initRepository()
        initUsecase()
        initViewModel()
    }
}

@propertyWrapper
struct Inject<T> {
    private let name: String?

    init(_ name: String? = nil) {
        self.name = name
    }

    var wrappedValue: T {
        let resolved = Container.shared.resolve(T.self, name: name)
        assert(resolved != nil, "Dependency not found: \(String(describing: T.self)) \(String(describing: name))")
        return resolved!
    }
}
