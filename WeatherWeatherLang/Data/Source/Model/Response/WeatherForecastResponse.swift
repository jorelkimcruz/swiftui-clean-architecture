import Foundation

struct WeatherForecastResponse: Decodable {
    let latitude: Double
    let longitude: Double
    let elevation: Double
    let generationTime: Duration?
    let utcOffset: Duration?
    let timezone: String?
    let timezoneAbbreviation: String?
}
