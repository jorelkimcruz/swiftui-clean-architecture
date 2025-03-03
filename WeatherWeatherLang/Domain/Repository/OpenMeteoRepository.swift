//
//  OpenMeteoRepository.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/3/25.
//

import Foundation
protocol OpenMeteoRepository {
    func getWeather(request: WeatherRequest) async throws -> WeatherForecastResponse
}
