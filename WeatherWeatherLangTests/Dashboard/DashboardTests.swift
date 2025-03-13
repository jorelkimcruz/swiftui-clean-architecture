//
//  dashboardTests.swift
//  WeatherWeatherLangTests
//
//  Created by jorel kim cruz on 3/5/25.
//

import XCTest
import Mockingbird
@testable import WeatherWeatherLang

class DashboardViewModelTests: XCTestCase {
    var viewModel : DashboardViewModel!
    fileprivate var getWeatherUsecase : GetWeatherUsecaseMock!
    
    func testGetWeather() async throws {
        self.getWeatherUsecase = GetWeatherUsecaseMock(repository: mock(OpenMeteoRepository.self))
        self.viewModel = DashboardViewModel(getWeatherUsecase)
        XCTAssertEqual(viewModel.viewState, .idle)
        try await viewModel.getWeather()
        XCTAssertEqual(viewModel.viewState, .success)
        XCTAssertEqual(getWeatherUsecase.runCalled, true)
    }
    
     override func tearDown() {
         self.viewModel = nil
         self.getWeatherUsecase = nil
         super.tearDown()
     }
    
    
}

fileprivate class GetWeatherUsecaseMock : GetWeatherUsecase {
    var runCalled = false;
    let forecast =  mock(WeatherForecastProtocol.self)
    override init(repository: any OpenMeteoRepository) {
        super.init(repository: repository)
    }
    override func run() async throws -> any WeatherForecastProtocol {
        runCalled = true
        return forecast
    }
}

