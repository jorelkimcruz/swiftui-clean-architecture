//
//  LoadingView.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/5/25.
//

import SwiftUI
struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.white.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            ProgressView()
                .scaleEffect(2)
        }
    }
}
