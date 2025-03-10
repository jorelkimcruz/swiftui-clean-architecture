//
//  WeatherRequest.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/3/25.
//

import Foundation

struct WeatherRequest: Encodable {
    let latitude: Double
    let longitude: Double
    let hourly: Forecast?
    let daily: Forecast?
    let current: Forecast?
    let elevation: Double?
    let pastDays: Int?
    let pastHours: Int?
    let pastMinutely15: Int?
    let forecastDays: Int?
    let forecastHours: Int?
    let forecastMinutely15: Int?
    let startDate: Date?
    let endDate: Date?
    let startHour: Date?
    let endHour: Date?
    let temperatureUnit: TemperatureUnit?

    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case hourly
        case daily
        case current
        case elevation
        case pastDays = "past_days"
        case pastHours = "past_hours"
        case pastMinutely15 = "past_minutely_15"
        case forecastDays = "forecast_days"
        case forecastHours = "forecast_hours"
        case forecastMinutely15 = "forecast_minutely_15"
        case startDate = "start_date"
        case endDate = "end_date"
        case startHour = "start_hour"
        case endHour = "end_hour"
        case temperatureUnit = "temperature_unit"
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
        try container.encodeIfPresent(hourly?.rawValue, forKey: .hourly)
        try container.encodeIfPresent(daily?.rawValue, forKey: .daily)
        try container.encodeIfPresent(current?.rawValue, forKey: .current)
        try container.encodeIfPresent(elevation, forKey: .elevation)
        try container.encodeIfPresent(pastDays, forKey: .pastDays)
        try container.encodeIfPresent(pastHours, forKey: .pastHours)
        try container.encodeIfPresent(pastMinutely15, forKey: .pastMinutely15)
        try container.encodeIfPresent(forecastDays, forKey: .forecastDays)
        try container.encodeIfPresent(forecastHours, forKey: .forecastHours)
        try container.encodeIfPresent(forecastMinutely15, forKey: .forecastMinutely15)
        try container.encodeIfPresent(startDate?.ISO8601Format(), forKey: .startDate)
        try container.encodeIfPresent(endDate?.ISO8601Format(), forKey: .endDate)
        try container.encodeIfPresent(startHour?.ISO8601Format(), forKey: .startHour)
        try container.encodeIfPresent(endHour?.ISO8601Format(), forKey: .endHour)
        try container.encodeIfPresent(temperatureUnit?.rawValue, forKey: .temperatureUnit)
    }
}
