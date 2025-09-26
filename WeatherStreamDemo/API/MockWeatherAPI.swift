actor MockWeatherAPI {
    func fetchWeather() async -> WeatherResponse {
        try? await Task.sleep(for: .seconds(1))
        return WeatherResponse(condition: WeatherCondition.allCases.randomElement()!)
    }
}