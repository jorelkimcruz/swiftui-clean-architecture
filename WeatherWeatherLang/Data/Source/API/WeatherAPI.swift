import Foundation

public struct WeatherForecast: Codable {
    public let latitude: Double
    public let longitude: Double
    public let timezone: String
    public let hourly: HourlyForecast
    public let daily: DailyForecast?
    
    public struct HourlyForecast: Codable {
        public let time: [String]
        public let temperature2m: [Double]
        public let relativeHumidity2m: [Int]
        public let precipitation: [Double]
        public let windSpeed10m: [Double]
        
        private enum CodingKeys: String, CodingKey {
            case time
            case temperature2m = "temperature_2m"
            case relativeHumidity2m = "relative_humidity_2m"
            case precipitation
            case windSpeed10m = "wind_speed_10m"
        }
    }
    
    public struct DailyForecast: Codable {
        public let time: [String]
        public let temperature2mMax: [Double]
        public let temperature2mMin: [Double]
        public let precipitationSum: [Double]
        
        private enum CodingKeys: String, CodingKey {
            case time
            case temperature2mMax = "temperature_2m_max"
            case temperature2mMin = "temperature_2m_min"
            case precipitationSum = "precipitation_sum"
        }
    }
}

public extension OpenMeteo {
    func weather(latitude: Double,
                longitude: Double,
                hourly: [String] = ["temperature_2m", "relative_humidity_2m", "precipitation", "wind_speed_10m"],
                daily: [String]? = ["temperature_2m_max", "temperature_2m_min", "precipitation_sum"],
                timezone: String = "GMT") async throws -> WeatherForecast {
        
        var parameters: [String: Any] = [
            "latitude": latitude,
            "longitude": longitude,
            "timezone": timezone,
            "hourly": hourly.joined(separator: ",")
        ]
        
        if let daily = daily {
            parameters["daily"] = daily.joined(separator: ",")
        }
        
        return try await fetch("forecast", parameters: parameters)
    }
} 