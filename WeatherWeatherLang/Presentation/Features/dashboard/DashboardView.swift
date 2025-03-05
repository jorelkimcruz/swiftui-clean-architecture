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
    @StateObject private var viewModel: DashboardViewModel
    @Environment(\.theme)
    var theme

    init() {
        _viewModel = DependencyInjectionInitializer.resolveStateObject()
    }

    var body: some View {
        Group {
            if viewModel.isLoading {
                LoadingView()
            } else {
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                    Image(Images.background, label: Text("BackgroundImage"))
                        .resizable().frame(minWidth: 0)
                        .edgesIgnoringSafeArea(.all)
                        .scaledToFill()
                    VStack(alignment: .center, content: {
                        Spacer().frame(height: theme.spacing.px100)
                        Text("Manila, Philippines").font(theme.typography.px37).foregroundStyle(theme.primary)
                        Text(viewModel.weather?.timezone ?? "")
                            .font(theme.typography.px102).foregroundStyle(theme.primary)
                        Text("Partly Cloudy").font(theme.typography.px24).foregroundStyle(theme.primary)
                        Text("H:23°C L:22°C").font(theme.typography.px21).foregroundStyle(theme.primary)
                        Spacer().frame(height: theme.spacing.px48)
                        Text("Cloudy with a chance of rain").font(theme.typography.px18).foregroundStyle(theme.primary)
                        Divider()
                            .overlay(theme.primary).padding(theme.spacing.px24)
                    })
                })
            }
        }.onAppear {
            viewModel.onScreenOpen()
        }
    }
}

#Preview {
    DashboardView()
}
