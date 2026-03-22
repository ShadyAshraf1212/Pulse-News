# 📰 Pulse News

A clean and modern news application built with Flutter that delivers real-time news across multiple categories with a smooth user experience.

## 📱 Screenshots

| Home | Category | Settings |
|------|----------|----------|
| ![Home](screenshots/home.png) | ![Category](screenshots/category.png) | ![Settings](screenshots/settings.png) |

## ✨ Features

- Browse news across multiple categories — General, Business, Sports, and more
- Filter articles by news source within each category
- Dark & Light theme support
- Multi-language support
- Smooth image loading with caching
- Relative timestamps on articles

## 🛠️ Tech Stack

- **Flutter** & **Dart**
- **HTTP Package** — REST API integration
- **Provider** — State Management
- **Cached Network Image** — Efficient image loading
- **Flutter ScreenUtil** — Responsive UI
- **Google Fonts** — Custom typography
- **Timeago** — Human-readable timestamps
- **Flutter Native Splash** — Branded splash screen

## 🔧 Getting Started

1. Clone the repository
```
git clone https://github.com/ShadyAshraf1212/Pulse-News.git
```

2. Add your API Key in `lib/constants/constants.dart`
```dart
const String apiKey = 'YOUR_API_KEY';
```

3. Run the app
```
flutter pub get
flutter run
```

## 🔑 API

This app uses [NewsAPI](https://newsapi.org) — Get your free API key from their website.
