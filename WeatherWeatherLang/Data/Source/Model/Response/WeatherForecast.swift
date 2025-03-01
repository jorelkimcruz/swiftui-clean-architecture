import Foundation

struct WeatherForecast: Codable {
    let latitude: Double
    let longitude: Double
    let timezone: String
    let hourly: HourlyForecast
    let daily: DailyForecast?
}
