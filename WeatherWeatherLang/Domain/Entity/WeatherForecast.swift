//
//  WeatherForecast.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/5/25.
//
protocol WeatherForecastProtocol {
    var latitude: Double { get }
    var longitude: Double { get }
    var elevation: Int? { get }
    var generationTime: String? { get }
    var utcOffset: String? { get }
    var timezone: String? { get }
    var timezoneAbbreviation: String? { get }
    var current: Current? { get }
    var currentUnits: Current? { get }
}

struct WeatherForecast: WeatherForecastProtocol {
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
