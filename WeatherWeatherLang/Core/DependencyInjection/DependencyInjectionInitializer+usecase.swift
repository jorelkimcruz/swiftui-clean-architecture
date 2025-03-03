//
//  DependencyInjectionInitializer+viewmodel.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//
import Swinject

extension DependencyInjectionInitializer {
    func initUsecase() {
        container.register(GetWeatherUsecase.self) { container in
            GetWeatherUsecase(repository: container.resolve(OpenMeteoRepository.self)!)
        }
        do {
            try validateDependencies()
        } catch {
            print("Error registering dependencies: \(error)")
        }
    }

    private func validateDependencies() throws {
        let dependencies: [() -> Any?] = [
            { self.container.resolve(GetWeatherUsecase.self) },
        ]

        for resolve in dependencies {
            guard resolve() != nil else {
                throw DependencyInjectionError.dependencyNotRegistered
            }
        }
        print("All Usecase dependencies are successfully registered.")
    }
}
