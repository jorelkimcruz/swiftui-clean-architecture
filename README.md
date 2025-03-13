#WORK IN PROGRESS
SwiftUI - Clean architecture - Coordinator

## Description
This is a sample project to show a clean architecture using SwiftUI with Coordinator pattern. 

## Architecture
The project is divided into layers:
- **Presentation**: Contains the SwiftUI views and view models.
- **Domain**: Contains the business logic.
- **Data**: Contains the data sources.
- **Core**: Contains the shared code.
- **Coordinator**: Contains the navigation between the views.

## Folder structure
WeatherWeatherLang
├── App
│   └── Routes
│   └── Main
├── Presentation
│   ├── Components
│   ├── Assets
│   │   ├── Constants
│   │   ├── Themes
│   │   └── Lottie Assets
│   └── Features
├── Domain
│   └── Models/Entity
├── Data
│   └── Source
│       ├── Response
│       └── API
│          └── Repository Implementation 
├── Core
│   ├── SharedCode
│   └── Utilities
├── Coordinator
│   └── Navigation
└── Assets
    └── Assets.xcassets

## Coordinator
The coordinator pattern is used to handle the navigation between the views. The coordinator is responsible for the navigation between them.

## Features
### Security
 - Detects jailbroken devices

## Dependencies
- [SwiftUI](https://developer.apple.com/xcode/swiftui/)
- [Combine](https://developer.apple.com/documentation/combine)
- [SwiftLint](https://swiftpackageindex.com/realm/SwiftLint)
- [SwiftFormat](https://github.com/nicklockwood/SwiftFormat)
- [Lottie](https://github.com/airbnb/lottie-ios)
- [mockingbird](https://github.com/Quick/mockingbird)

##SOON 
- [Quick](https://github.com/Quick/Quick)
- [Nimble](https://github.com/Quick/Nimble)

Quick and nimble currently doesnt support Swift 6, will add as soon as it supports it
