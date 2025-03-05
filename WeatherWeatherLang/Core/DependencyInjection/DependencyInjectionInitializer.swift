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

    static func resolveStateObject<T>() -> T {
        let resolvedobj = Container.shared.resolve(T.self)
        assert(resolvedobj != nil, "Dependency not found: \(String(describing: T.self))")
        return resolvedobj!
    }
}
