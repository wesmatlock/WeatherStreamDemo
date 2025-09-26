import Foundation
import SwiftUI

@Observable
final class StreamViewModel {
    var weather: WeatherCondition = .clear
    private var task: Task<Void, Never>?

    init(api: MockWeatherAPI) {
        task = Task {
            for await update in Self.pollingStream(api: api) {
                await MainActor.run { self.weather = update }
            }
        }
    }

    deinit {
        task?.cancel()
    }

    static func pollingStream(api: MockWeatherAPI) -> AsyncStream<WeatherCondition> {
        AsyncStream { continuation in
            Task {
                while !Task.isCancelled {
                    let update = await api.fetchWeather()
                    continuation.yield(update.condition)
                    try? await Task.sleep(for: .seconds(3))
                }
                continuation.finish()
            }
        }
    }
}
