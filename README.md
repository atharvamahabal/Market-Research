# Market Research Paper Trading App

## 1. Project Overview

A comprehensive paper trading application designed for market research and educational purposes. This app allows users to simulate real trading scenarios without financial risk, providing valuable insights into market behavior and trading strategies. The application features real-time market data simulation, portfolio management, strategy building tools, and comprehensive backtesting capabilities.

**Key Benefits:**
- Risk-free trading simulation for educational purposes
- Advanced strategy building and testing capabilities
- Real-time portfolio tracking and performance analysis
- Market research tools for data-driven decision making

## 2. Features

### Dashboard
- Real-time market overview with simulated price movements
- Quick access to portfolio performance metrics
- Market news and alerts integration
- Customizable watchlists and market sectors

### Portfolio Management
- Virtual portfolio creation and management
- Real-time position tracking and P&L calculations
- Transaction history and trade logs
- Asset allocation visualization
- Risk metrics and performance analytics

### Strategy Builder
- Visual strategy creation interface
- Pre-built strategy templates (Moving Average, RSI, MACD)
- Custom indicator configuration
- Strategy parameter optimization
- Multi-timeframe strategy testing

### Backtesting Engine
- Historical data simulation for strategy validation
- Performance metrics calculation (Sharpe ratio, maximum drawdown, win rate)
- Detailed backtesting reports with charts and statistics
- Strategy comparison tools
- Export capabilities for analysis reports

## 3. Tech Stack

### Frontend
- **Flutter** - Cross-platform mobile development framework
- **Riverpod** - State management solution for reactive programming
- **GoRouter** - Declarative routing package for Flutter
- **SQLite** - Local database for data persistence
- **Charts Flutter** - Data visualization and charting library

### Backend & Services
- **Firebase** - Backend-as-a-service platform
  - Authentication (Google Sign-In)
  - Cloud Firestore for user data
  - Cloud Storage for user-generated content
  - Firebase Analytics for user behavior tracking

### Development Tools
- **Dart** - Programming language for Flutter
- **Android Studio** - Primary IDE for development
- **VS Code** - Alternative development environment
- **Git** - Version control system

## 4. Setup Instructions

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK (comes with Flutter)
- Android Studio or VS Code
- Git for version control
- Java Development Kit (JDK) 8 or higher

### Flutter Installation
1. Download Flutter SDK from [flutter.dev](https://flutter.dev)
2. Extract the zip file to your desired location
3. Add Flutter to your PATH environment variable
4. Run `flutter doctor` to verify installation
5. Accept Android licenses: `flutter doctor --android-licenses`

### Google Authentication Setup

#### Generate SHA-1 Certificate
1. **For Debug Build:**
   ```bash
   cd android
   ./gradlew signingReport
   ```
   Look for the SHA1 under the "debug" variant

2. **For Release Build:**
   ```bash
   keytool -list -v -keystore your-keystore.jks
   ```

#### Configure Firebase Project
1. Go to [Firebase Console](https://console.firebase.google.com)
2. Create a new project or select existing one
3. Add Android app with package name: `com.marketresearch.market_research`
4. Register the SHA-1 certificate fingerprint
5. Download `google-services.json` file
6. Place it in `android/app/` directory

#### Enable Google Sign-In
1. In Firebase Console, go to Authentication > Sign-in method
2. Enable Google as a sign-in provider
3. Configure your support email
4. Save the configuration

### Project Configuration
1. Clone the repository:
   ```bash
   git clone [your-repo-url]
   cd market-research
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Configure Firebase (if not already done):
   - Place `google-services.json` in `android/app/`
   - Update `android/build.gradle` with Firebase dependencies

## 5. How to Run

### Windows Development
1. **Run on Windows Desktop:**
   ```bash
   flutter config --enable-windows-desktop
   flutter run -d windows
   ```

2. **Build for Windows:**
   ```bash
   flutter build windows
   ```

### Android Development
1. **Connect Android Device:**
   - Enable Developer Options on your Android device
   - Enable USB Debugging
   - Connect via USB and accept the RSA key prompt

2. **Run on Android Device:**
   ```bash
   flutter run
   ```

3. **Build APK:**
   ```bash
   flutter build apk --release
   ```

4. **Build App Bundle (for Play Store):**
   ```bash
   flutter build appbundle
   ```

### Development Commands
```bash
# Clean build
flutter clean

# Get dependencies
flutter pub get

# Run with hot reload
flutter run

# Run with verbose logging
flutter run --verbose

# Check for issues
flutter doctor
```

### Testing
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/unit_test.dart

# Run integration tests
flutter drive --target=test_driver/app.dart
```

## 6. Project Structure

```
lib/
├── main.dart                 # Application entry point
├── config/                   # Configuration files
├── models/                   # Data models
├── providers/                # Riverpod providers
├── screens/                  # UI screens
├── services/                 # Business logic
├── utils/                    # Utility functions
└── widgets/                  # Reusable widgets

android/
├── app/
│   ├── google-services.json  # Firebase configuration
│   └── build.gradle         # Android build configuration
└── build.gradle             # Project-level build configuration
```

## 7. Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 8. License

This project is licensed under the MIT License - see the LICENSE file for details.

## 9. Support

For support and questions:
- Create an issue in the GitHub repository
- Contact the development team
- Check the documentation in the `/docs` folder

---

**Note:** This is a paper trading application for educational and research purposes only. No real money is involved in any transactions.