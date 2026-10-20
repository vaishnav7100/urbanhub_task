# Finlot Mobile Application - Flutter UI

A pixel-perfect, production-grade Flutter implementation of the **Finlot** mobile application UI designed for the UrbanHub technical assessment.

---

## Overview

This repository contains the complete implementation of Finlot's primary user journeys, built with an emphasis on visual fidelity, smooth micro-interactions, responsive geometry, and idiomatic Dart code architecture.

### Screens Implemented
1. **Splash Screen**
   - Signature multi-ellipse ambient mesh blur backdrop (`#E0F37D` and `#FFE472` layer blurs).
   - Finlot logo with pulse animation and seamless timed transition to Onboarding.
2. **Onboarding Flow**
   - 3-step interactive `PageView` featuring high-resolution visuals.
   - Custom segmented top progress indicator with fractional page synchronization.
   - Bottom-to-top soft gradient transitions and responsive call-to-action button.
3. **Home Dashboard**
   - Dual-toned gradient background.
   - User profile header with notification indicator.
   - Segmented toggle control (*Manage Pool* vs. *Joined Pool*).
   - High-contrast balance card with quick actions (*Deposit*, *Withdraw*, *More*).
   - Activity feed with dynamic category icons and status badges.
   - Custom bottom navigation bar with active state indicators.

---

## Technical Highlights

- **Custom Graphics & Blurs**: Engineered using Flutter's `CustomPainter` to faithfully recreate Figma's radial layer blurs and ambient lighting effects without third-party bloat.
- **Typography**: Local integration of the complete **TT Fors Trial** font family across 9 weights with accurate line-height ratios.
- **Theme & Design Tokens**: Centralized in `AppTheme` for consistent color schemes, surface tokens, and border radiuses.
- **Strict Code Standards**: 100% compliant with `flutter_lints`, zero analyzer warnings, and formatted according to official Dart guidelines.
- **Automated Testing**: Includes widget tests validating widget rendering, asset loading, and navigation timers.

---

## Getting Started

### Prerequisites
- Flutter SDK (v3.11.1 or higher)
- Dart SDK (^3.11.1)
- Android Studio / VS Code with Flutter extension
- Android or iOS emulator / physical device

### Installation & Run

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd urbanhub_task
   ```

2. Fetch dependencies:
   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run
   ```

---

## Code Quality & Verification

Run static code analysis:
```bash
flutter analyze
```
*(Result: 0 issues found)*

Run the automated test suite:
```bash
flutter test
```
*(Result: All tests passed)*

---

## Project Structure

```
lib/
├── main.dart                   # Application entrypoint & theme binding
├── routes/
│   └── app_routes.dart         # Named routing configuration
├── theme/
│   └── app_theme.dart          # Central design system, colors, and typography
└── screens/
    ├── splash_screen.dart      # Splash branding screen & background painter
    ├── onboarding_screen.dart  # 3-step onboarding flow & progress indicators
    └── home_screen.dart        # Main dashboard, pool tabs, & bottom navigation
test/
└── splash_screen_test.dart     # Widget & transition test suite
assets/
├── font/                       # TT Fors font family weights
└── images/                     # Screen graphics and illustrations
```
