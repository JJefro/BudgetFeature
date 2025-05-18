# BudgetFeature
A Swift Package that shows a simple budgeting feature using SwiftUI.
Built using a **modular SwiftUI architecture with Presenter and Interactor layers** — inspired by MVVM and Clean Architecture.

## Tech Stack
- **SwiftUI** – declarative UI framework
- **Swift Concurrency (async/await)** – for asynchronous code
- **Swift Package Manager** – modular and testable architecture
- **Swift Testing** – for unit tests
- **Charts** – for pie chart visualization

## Architecture
- **View** – displays the UI and reacts to state changes
- **Interactor** – contains business logic
- **Presenter** – manages screen state
- **Entity** – defines data models shared across the app
- **BudgetService** – simulates data loading with delays and reads from local JSON files

## Requirements
- Xcode 15 or later
- iOS 17.0 or later

## Installation
### Using Swift Package Manager (SPM)
Open your project
Go to **File > Add Packages**
Enter the URL:
   ```
   https://github.com/JJefro/BudgetFeature.git
   ```
Select version `1.0.2` or higher

### Add the package to your local package
In your `Package.swift`:
```swift
dependencies: [
    .package(url: "https://github.com/JJefro/BudgetFeature.git", from: "1.0.2")
]
```
And in your target:
```swift
.target(
  name: "YourTarget",
  dependencies: [
    .product(name: "BudgetFeature", package: "BudgetFeature")
  ]
)
```
## Usage
After installing the package, you can start using the main screen like this:
```swift
import BudgetFeature

var body: some View {
    BudgetView()
}
```
This will display the full budget overview UI with mocked data and navigation to details.

## Preview
![Simulator Screen Recording - iPhone 16 Pro - 2025-05-18 at 19 29 56](https://github.com/user-attachments/assets/babaeb0f-6891-47a5-a7b5-2831ad92fc5f)
