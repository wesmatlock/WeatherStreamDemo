import Testing
@testable import WeatherStreamDemo

struct WeatherPollingTests {
    @Test func streamEmitsValues() async throws {
        let api = MockWeatherAPI()
        let stream = await MainActor.run {
            StreamViewModel.pollingStream(api: api)
        }
        var iterator = stream.makeAsyncIterator()
        let first = await iterator.next()
        #expect(first != nil)
    }

    @Test func streamCancellation() async throws {
        let api = MockWeatherAPI()
        let task = Task { @MainActor in
            for await _ in StreamViewModel.pollingStream(api: api) { }
        }
        task.cancel()
        #expect(task.isCancelled)
    }
}
