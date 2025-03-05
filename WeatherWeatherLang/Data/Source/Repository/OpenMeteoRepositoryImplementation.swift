//
//  OpenMeteoRepositoryImplementation.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/3/25.
//

import Foundation

struct OpenMeteoRepositoryImplementation: OpenMeteoRepository {
    let api: API

    private let getweatherURL = "/forecast"

    func getWeather(request: WeatherRequest) async throws -> WeatherForecastResponse {
        try await api.fetch(getweatherURL, parameters: request)
    }
}
