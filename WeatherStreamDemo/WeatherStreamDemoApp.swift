import SwiftUI

@main
struct WeatherStreamDemoApp: App {
    let api = MockWeatherAPI()
    @State var viewModel = StreamViewModel(api: MockWeatherAPI())

    var body: some Scene {
        WindowGroup {
            SeatAvailabilityView(condition: viewModel.weather)
                .padding()
        }
    }
}
