//
//  WeatherForecast.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/5/25.
//

struct WeatherForecast: Decodable {
    let latitude: Double
    let longitude: Double
    let elevation: Double
    let generationTime: Duration?
    let utcOffset: Duration?
    let timezone: String?
    let timezoneAbbreviation: String?
}
