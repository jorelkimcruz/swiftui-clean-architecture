//
//  WeatherForecast.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/5/25.
//

struct WeatherForecast {
    let latitude: Double
    let longitude: Double
    let elevation: Int?
    let generationTime: String?
    let utcOffset: String?
    let timezone: String?
    let timezoneAbbreviation: String?
    let current: Current?
    let currentUnits: Current?
}

struct Current {
    let interval: String?
    let temperature: String?
    let time: String?
}
