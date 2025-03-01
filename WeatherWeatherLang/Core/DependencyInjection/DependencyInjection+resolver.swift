//
//  DependencyInjection+resolver.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//

import Foundation

@propertyWrapper
struct Inject<I> {
    let wrappedValue: I
    init() {
        //Resolve the interface to an implementation.
        self.wrappedValue = Resolver.shared.resolve(I.self)
    }
}

class Resolver {
    static let shared = Resolver()
    
    //get the IOC container
    private var container = DependencyInjectionInitializer.shared.container
    
    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }
}
