//
//  getForecastUsecase.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/3/25.
//

import Foundation

struct GetWeatherUsecase {
    let repository: OpenMeteoRepository

    func run() async throws -> WeatherForecastResponse {
        let request = WeatherRequest(latitude: 14.599512, longitude: 120.984222, hourly: nil, daily: nil)
        do {
            let response: WeatherForecastResponse = try await repository.getWeather(request: request)
            print(response)
            return response
        } catch {
            print(error)
            throw error
        }
    }
}
