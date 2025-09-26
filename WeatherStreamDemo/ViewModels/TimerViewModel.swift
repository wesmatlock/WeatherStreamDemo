import Foundation
import SwiftUI

@MainActor
@Observable
final class TimerViewModel {
    var weather: WeatherCondition = .clear
    @ObservationIgnored private var timer: Timer?

    init(api: MockWeatherAPI) {
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [weak self] _ in
            Task { @MainActor in
                let response = await api.fetchWeather()
                self?.weather = response.condition
            }
        }
    }

    deinit {
        timer?.invalidate()
    }
}
