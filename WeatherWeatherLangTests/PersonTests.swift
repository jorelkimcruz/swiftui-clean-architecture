//
//  WeatherWeatherLangTests.swift
//  WeatherWeatherLangTests
//
//  Created by jorel kim cruz on 3/2/25.
//
import XCTest
import Mockingbird
@testable import WeatherWeatherLang

class PersonTests: XCTestCase {
    
    var repo: OpenMeteoRepositoryMock!
    var getWeather: GetWeatherUsecaseMock!
    
    override func setUp() {
        repo = mock(OpenMeteoRepository.self)
        getWeather = GetWeatherUsecaseMock(repository: repo)
        
    }
}
