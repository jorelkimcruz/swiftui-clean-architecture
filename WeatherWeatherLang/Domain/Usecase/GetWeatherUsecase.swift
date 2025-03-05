//
//  getForecastUsecase.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/3/25.
//

import Foundation

struct GetWeatherUsecase {
    let repository: OpenMeteoRepository

    func run() async throws -> WeatherForecast {
        let request = WeatherRequest(latitude: 14.599512, longitude: 120.984222, hourly: nil,
                                     daily: nil, elevation: nil,
                                     pastDays: nil, pastHours: nil, pastMinutely15: nil, forecastDays: nil,
                                     forecastHours: nil, forecastMinutely15: nil, startDate: nil, endDate: nil,
                                     startHour: nil, endHour: nil)

        let response: WeatherForecastResponse = try await repository.getWeather(request: request)
        return WeatherForecast(latitude: response.latitude,
                               longitude: response.longitude,
                               elevation: response.elevation,
                               generationTime: response.generationTime,
                               utcOffset: response.utcOffset, timezone: response.timezone,
                               timezoneAbbreviation: response.timezoneAbbreviation)
    }
}
