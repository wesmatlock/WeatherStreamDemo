import Foundation
import Combine
import Observation

@Observable
final class CombineViewModel {
    var weather: WeatherCondition = .clear
    private var cancellables = Set<AnyCancellable>()

    init(api: MockWeatherAPI) {
        Timer.publish(every: 3, on: .main, in: .common)
            .autoconnect()
            .flatMap { _ in
                Future { promise in
                    Task {
                        let response = await api.fetchWeather()
                        promise(.success(response.condition))
                    }
                }
            }
            .receive(on: RunLoop.main)
            .sink { [weak self] value in
                self?.weather = value
            }
            .store(in: &cancellables)
    }
}
