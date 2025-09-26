# 🌤 WeatherStreamDemo

**AsyncSequence for Real-Time APIs: From Legacy Polling to Swift 6 Elegance**  
A modern Swift 6 demo that rewrites your old polling patterns the way SwiftUI apps *should* work in 2025.

---

## 🚀 Why This Exists

Real-time updates used to mean `Timer`, `DispatchQueue`, and "hope for the best."  
This project shows how to upgrade that to a clean, cancelable, testable stream — using `AsyncStream` in Swift 6.

You’ll see:
- ✅ Legacy `Timer`-based polling (yes, the scary stuff)
- 🔗 Combine-powered pipelines
- 🌊 AsyncStream done right — fully structured, cancelable, and SwiftUI-friendly
- 🧪 SwiftTesting-based unit tests
- 🟩 `SeatAvailabilityView` that updates in real time
- 🔌 Bonus: a mocked WebSocket `AsyncSequence`

---

## 🛠 Requirements

- Xcode 26+
- iOS 18+
- Swift 6.2+

---

## 📂 Project Structure

```
WeatherStreamDemo/
├── Sources/
│   └── WeatherStreamDemo/
│       ├── API/
│       ├── Models/
│       ├── ViewModels/
│       ├── Views/
│       └── WeatherStreamDemoApp.swift
├── Tests/
│   └── WeatherPollingTests/
│       └── WeatherPollingTests.swift
├── README.md
```

---

## 💡 What You’ll Learn

- How to bridge legacy polling into a modern Swift Concurrency pipeline
- When `Timer` still works (barely), and when to upgrade
- Why `AsyncStream` beats Combine for structured updates
- How to cancel cleanly when users leave the view
- How to test async sequences without losing your mind (or CI budget)

---

## 🧪 Tests Included

```swift
#expect(first != nil)
#expect(task.isCancelled)
```
---

## 🌀 Bonus: Mock WebSocket FTW

```swift
struct MockWebSocket: AsyncSequence {
    ...
}
```

Swap in your actual socket implementation later — this view model won’t even blink.

---

## 📖 Related Blog Post

This project was featured in:  
📓 [AsyncSequence for Real-Time APIs: From Legacy Polling to Swift 6 Elegance](https://medium.com/@wesleymatlock/asyncsequence-for-real-time-apis-from-legacy-polling-to-swift-6-elegance-abc123)

---

## ✈️ About the Author

Hi, I’m Wes — an iOS dev who builds SwiftUI apps with real-world constraints, battle-tested CI, and just enough sarcasm to keep it fun.  
Find more posts at [medium.com/@wesleymatlock](https://medium.com/@wesleymatlock) and my project at [wesleymatlock.com](https://wesleymatlock.com)

---
