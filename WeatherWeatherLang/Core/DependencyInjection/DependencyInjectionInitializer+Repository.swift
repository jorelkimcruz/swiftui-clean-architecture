//
//  DependencyInjectionInitializer+Repository.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/3/25.
//

import Swinject

extension DependencyInjectionInitializer {
    func initRepository() {
        container.register(OpenMeteoRepository.self) { container in
            OpenMeteoRepositoryImplementation(api: container.resolve(API.self)!)
        }
        do {
            try validateDependencies()
        } catch {
            print("Error registering dependencies: \(error)")
        }
    }

    private func validateDependencies() throws {
        let dependencies: [() -> Any?] = [
            { self.container.resolve(OpenMeteoRepository.self) },
        ]

        for resolve in dependencies {
            guard resolve() != nil else {
                throw DependencyInjectionError.dependencyNotRegistered
            }
        }
        print("All Repository dependencies are successfully registered.")
    }
}
