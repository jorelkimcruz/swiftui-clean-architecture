//
//  DependencyInjectionInitializer.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//

import Foundation
import Swinject

struct DependencyInjectionInitializer {
    static let shared = DependencyInjectionInitializer()
    
    let container = Container()
    
    func initialize() {
         container.register(Coordinator.self) { _  in
             return Coordinator()
         }.inObjectScope(.container)
        // container.register(TodoDataSource.self) { _  in
        //     return TodoMockDataSourceImpl()
        // }.inObjectScope(.container)
        // container.register(TodoRepository.self) { _  in
        //     return TodoRepositoryImpl()
        // }.inObjectScope(.container)
    }
}
