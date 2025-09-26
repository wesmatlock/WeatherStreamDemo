import SwiftUI

struct SeatAvailabilityView: View {
    let condition: WeatherCondition

    var body: some View {
        Circle()
            .fill(condition == .clear ? .green : .red)
            .frame(width: 100, height: 100)
            .overlay(
                Text(condition.rawValue.capitalized)
                    .font(.headline)
                    .foregroundStyle(.white)
            )
    }
}

#Preview {
    SeatAvailabilityView(condition: .clear)
}
