# Ualá Challenge — City Explorer

## Overview

This app loads a list of over 200,000 cities and lets users explore them through search, favorites, detail views, and map visualization. It was designed to be responsive, simple, and fast. The interface changes depending on orientation: a split-screen layout in landscape and a single-view stack in portrait.

---

## Problem-Solving Approach

The core requirement was implementing a fast and responsive prefix-based search through a large dataset. The JSON file is loaded once into memory, and filtering is done locally. This avoids unnecessary repeated parsing or networking overhead.

Search uses a case-insensitive `hasPrefix` logic, as specified. To prevent excessive filtering while the user is typing, Combine is used to debounce the input by 300ms.

Favorites are handled in-memory and persisted with `UserDefaults` between app launches. Filtering by favorites is handled through a simple `Toggle`.

I also implemented a responsive UI layout using `GeometryReader`. When the device is in landscape mode, the list appears on the left and either a map or a detail view appears on the right. In portrait mode, each screen is shown separately with navigation.

---

## Architecture and Implementation Details

- **MVVM pattern**: Clear separation of concerns. `CitiesListViewModel` is responsible for business logic and data transformation.
- **Routing**: A `CitiesRouter` protocol and a `CitiesRoutes` enum handle screen navigation in a scalable and testable way.
- **Networking**: The `CityService` fetches the cities JSON using `URLSession`. It’s simple and sufficient for the single-endpoint use case.
- **Persistence**: Favorite cities are saved with `UserDefaults`, wrapped inside `FavoritesStorageProtocol` to keep the logic testable and decoupled.
- **Map integration**: `CityMapScreen` uses SwiftUI's `Map` to show the selected city's coordinates. iOS 17's new `Map` content builder is used.
- **Custom styling**: Colors, fonts, spacing, and icons are defined via extensions (`Color`, `Font`, `CGFloat`, `Image`) for consistency and reuse.
- **Localization**: All strings (including accessibility labels) are localized through a centralized `String` extension and `Localizable.strings` file.
- **Launch screen**: A custom splash screen is shown briefly at startup, consistent with common app flows.

---

## Responsive UI

- In **portrait**, the flow is linear: list → map/details.
- In **landscape**, a responsive layout displays the list on one side and either the map or detail view on the other.
- Switching orientations retains the selected city and layout state.

---

## Tests

### Unit Tests

The project includes unit tests following the **Given-When-Then** pattern. These are written with mock data to ensure fast and isolated test runs.

Tests cover:

- Correct filtering when the search field is empty
- Case-insensitive prefix matching
- Behavior with invalid search terms
- Filtering with and without the favorites toggle

Mocks were used for both `CityServiceProtocol` and `FavoritesStorageProtocol`.

---

## Project Structure

## Project Structure

- **Coordinators/**: Navigation logic using `Router` and `CitiesRoutes`
- **Core/**
  - **Models/**: Data models like `City` and `CityViewData`
  - **Service/**: `CityServiceProtocol` and implementation
  - **Storage/**: UserDefaults wrapper (`FavoritesStorage`)
  - **Utils/**: Helpers and general-purpose code
- **Extensions/**: Custom extensions for `CGFloat`, `Color`, `Image`, etc.
- **Features/**
  - **Cities/**
    - **ViewModels/**: `CitiesListViewModel`, `CityDetailDisplayMode`
    - **Views/**: All main views including list, map, and responsive layouts
- **Fonts/**: Custom typography like `UalaFont`, and Inter font files
- **Localization/**: String localization files
- **UIComponents/**: Reusable UI elements like `SearchBar`, `BackButton`, etc.
- **Onboarding/**: Splash
- **Tests/**
  - `UalaChallengeTests/`: Unit tests (Given-When-Then structure)
    
---

#Demo:
https://drive.google.com/drive/folders/1F63eGvxoIwJxJCODhbtcFno00RQKjqvo?usp=drive_link

#Challenge:
[Mobile Challenge - v0.7.pdf](https://github.com/user-attachments/files/20260120/Mobile.Challenge.-.v0.7.pdf)

