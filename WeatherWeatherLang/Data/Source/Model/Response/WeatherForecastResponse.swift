import Foundation
struct WeatherForecastResponse: Decodable {
    let latitude: Double
    let longitude: Double
    let elevation: Int?
    let generationTime: Double?
    let utcOffset: Int?
    let timezone: String?
    let timezoneAbbreviation: String?
    let current: CurrentResponse?
    let currentUnits: CurrentUnitResponse?

    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case elevation
        case generationTime = "generationtime_ms"
        case utcOffset = "utc_offset_seconds"
        case timezone
        case timezoneAbbreviation = "timezone_abbreviation"
        case current
        case currentUnits = "current_units"
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.latitude = try container.decode(Double.self, forKey: .latitude)
        self.longitude = try container.decode(Double.self, forKey: .longitude)
        self.elevation = try container.decode(Int.self, forKey: .elevation)
        self.generationTime = try container.decodeIfPresent(Double.self, forKey: .generationTime)
        self.utcOffset = try container.decodeIfPresent(Int.self, forKey: .utcOffset)
        self.timezone = try container.decodeIfPresent(String.self, forKey: .timezone)
        self.timezoneAbbreviation = try container.decodeIfPresent(String.self, forKey: .timezoneAbbreviation)
        self.current = try container.decodeIfPresent(CurrentResponse.self, forKey: .current)
        self.currentUnits = try container.decodeIfPresent(CurrentUnitResponse.self, forKey: .currentUnits)
    }
}

struct CurrentResponse: Decodable {
    let interval: Int?
    let temperature2m: Double?
    let time: String?

    enum CodingKeys: String, CodingKey {
        case interval
        case temperature2m = "temperature_2m"
        case time
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.interval = try? container.decode(Int.self, forKey: .interval)
        self.temperature2m = try? container.decode(Double.self, forKey: .temperature2m)
        self.time = try? container.decode(String.self, forKey: .time)
    }
}

struct CurrentUnitResponse: Decodable {
    let interval: String?
    let temperature2m: String?
    let time: String?

    enum CodingKeys: String, CodingKey {
        case interval
        case temperature2m = "temperature_2m"
        case time
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.interval = try? container.decode(String.self, forKey: .interval)
        self.temperature2m = try? container.decode(String.self, forKey: .temperature2m)
        self.time = try? container.decode(String.self, forKey: .time)
    }
}
