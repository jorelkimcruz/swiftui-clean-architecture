//
//  ErrorView.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/5/25.
//

import SwiftUI

struct ErrorView: View {
    let error: String

    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .font(.largeTitle)
                .foregroundColor(.red)
            Text("Error")
                .font(.title)
                .foregroundColor(.red)
            Text(error)
                .font(.body)
                .foregroundColor(.secondary)
                .padding()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
