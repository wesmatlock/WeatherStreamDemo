enum WeatherCondition: String, CaseIterable {
    case clear, stormy
}

struct WeatherResponse {
    let condition: WeatherCondition
}