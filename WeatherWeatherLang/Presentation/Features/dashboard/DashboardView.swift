//
//  DashboardView.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//

import Foundation
import SwiftUI
import Swinject

struct DashboardView: View {
    @Inject var viewModel: DashboardViewModel
    @Inject var viewModelss: DashboardViewModel
    @Environment(\.theme)
    var theme
    var body: some View {
        Group { // because you can't attach modifiers directly to a switch
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                Image(Images.background, label: Text("BackgroundImage"))
                    .resizable().frame(minWidth: 0)
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                VStack(alignment: .center, content: {
                    Spacer().frame(height: theme.spacing.px100)
                    Text("Manila, Philippines").font(theme.typography.px37).foregroundStyle(theme.primary)
                    Text("28°C").font(theme.typography.px102).foregroundStyle(theme.primary)
                    Text("Partly Cloudy").font(theme.typography.px24).foregroundStyle(theme.primary)
                    Text("H:23°C L:22°C").font(theme.typography.px21).foregroundStyle(theme.primary)
                    Spacer().frame(height: theme.spacing.px48)
                    Text("Cloudy with a chance of rain").font(theme.typography.px18).foregroundStyle(theme.primary)
                    Divider()
                        .overlay(theme.primary).padding(theme.spacing.px24)
                })
            })
        }.task {
            do {
                let weather = try await viewModel.getWeather()
                print(weather)
            } catch {
                print(error)
            }
            do {
                let weather = try await viewModelss.getWeather()
                print(weather)
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    DashboardView()
}
