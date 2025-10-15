# SwiftUI Scrollable Tab Bar

A modern, scrollable tab bar component for SwiftUI with synchronized content scrolling and smooth animations. Perfect for apps with multiple tabs that need horizontal navigation.

![SwiftUI](https://img.shields.io/badge/SwiftUI-5.0+-blue.svg)
![iOS](https://img.shields.io/badge/iOS-14.0+-lightgrey.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

## ✨ Features

- **Smooth Scrolling** - Horizontal scrollable tab bar for multiple items
- **Synchronized Navigation** - Tab selection syncs with content scroll and vice versa
- **Custom Animations** - Smooth snap animations for tab transitions
- **Modern Design** - Clean, iOS-native appearance
- **Flexible Architecture** - Easy to customize tabs and content
- **Scroll Position Tracking** - Advanced scroll state management

## 🎯 Preview

<img src="https://via.placeholder.com/300x600?text=Scrollable+TabBar+Demo" width="300">

## 🚀 Installation

### Swift Package Manager

Add this repository to your Xcode project:
1. File → Add Package Dependencies
2. Enter URL: `https://github.com/Boris-88/ScrollTabbar.git`
3. Select "ScrollTabbar" package

### Manual Installation

Copy these files to your project:
- `Home.swift`
- `TabModel.swift`
- `ContentView.swift`
- `ScrollTabbarApp.swift`

## 💻 Usage

### Basic Implementation

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .preferredColorScheme(.light)
    }
}
