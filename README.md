# AttributedBuilder

A builder-style wrapper for NSAttributedString. 

![Swift 5.0](https://img.shields.io/badge/Swift-5.2-orange)
![Swift Package Manager](https://img.shields.io/badge/SwiftPM-compatible-brightgreen)
![Platforms](https://img.shields.io/badge/Platforms-iOS%20+%20macOS-blue)
![GitHub issues](https://img.shields.io/github/issues-raw/devmaximilian/attributed-builder)

### Requirements

- iOS 9 (or macOS 10.10)
- Swift 5.0

### Example usage

The following example demonstrates creating an attributed string.

```swift
// Optional: Create an alias for NSAttributedString
typealias AttributedString = NSAttributedString

let value = AttributedString("Hello, world!")
    .font(.largeTitle)
    .foregroundColor(.darkGray)
    .backgroundColor(.yellow)
```


### Disclaimer

This package utilizes the `UIKit` or `Cocoa` framework (depending on platform), both of which are property of Apple Inc.

AttributedBuilder is an independent open source effort and has not been authorized, sponsored, or otherwise approved by Apple Inc.

