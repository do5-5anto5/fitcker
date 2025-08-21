# Fitcker

Fitness Tracker app

# Fitcker - Flutter Fitness Tracker

Fitcker is a Flutter-based mobile application designed to help users track their workouts, monitor their progress, and stay motivated on their fitness journey. The app features user authentication, onboarding for new users, workout logging, dynamic quote displays, and a calendar view for progress visualization.

## 🚧 Project Status 🚧

This project is currently **under active development**. Core features are being implemented, and the architecture is being refined for scalability and maintainability. We are focused on building a robust foundation before expanding to more advanced functionalities.

## ✨ Features

*   **User Authentication & Authorization:**
    *   Secure Sign-Up with email and password.
    *   Sign-In for returning users.
    *   Session management with persistence.
    *   Route protection based on authentication status.
*   **Onboarding Experience:**
    *   A welcoming multi-step onboarding flow for new users.
    *   Onboarding completion status persisted locally to prevent redundant displays.
*   **Workout Management:**
    *   Log new workouts with details (e.g., type of exercise, duration, notes - *details to be expanded*).
    *   View a chronological list of past workouts.
    *   Ability to mark workouts as complete or pending.
    *   Option to remove workouts from the log.
*   **Workout Calendar Graph:**
    *   Interactive calendar view highlighting days with logged workouts.
    *   Provides a visual overview of workout consistency and progress over time.
*   **Motivational Quotes:**
    *   Display of inspirational quotes, fetched dynamically from an external source, to keep users motivated.
*   **User Profile (Planned):**
    *   Dedicated screen for users to view and manage their profile information (e.g., name, preferences - *details to be expanded*).
*   **Stateful Bottom Navigation:**
    *   Main application interface structured with a bottom navigation bar.
    *   Each tab maintains its own navigation stack and state for a seamless user experience.

## 🏛️ Architecture

Fitcker is being built with a focus on modern Flutter development practices and a clean, scalable architecture, heavily influenced by Clean Architecture principles:

*   **State Management:** [Riverpod](https://riverpod.dev/) (utilizing `riverpod_annotation` for code generation and `hooks_riverpod` for widget integration) serves as the primary state management solution, ensuring a reactive and predictable data flow.
*   **Navigation:** [GoRouter](https://pub.dev/packages/go_router) handles declarative routing (Navigator 2.0), featuring:
    *   Centralized and type-safe route configuration (`router.dart`, `route_names.dart`).
    *   `StatefulShellRoute.indexedStack` for persistent state across bottom navigation tabs.
    *   Custom redirect logic (`redirection.dart`) based on the user's onboarding and authentication status.
*   **Domain Layer:** A dedicated domain layer isolates core business logic:
    *   **Entities:** Business objects like `User`, `Workout`, `Quote`.
    *   **Abstract Repositories:** Interfaces (e.g., `AuthRepository`, `WorkoutRepository`) defining contracts for data operations, keeping the domain independent of data sources.
    *   **Use Cases (Planned):** Will encapsulate specific business rules and orchestrate calls to repositories.
    *   **Functional Error Handling:** `dartz` (`Either` type) is used for robustly handling success and failure scenarios in domain operations.
*   **Data Layer (Planned/Implicit):** Will contain concrete implementations of domain repositories, interacting with data sources (e.g., Firebase, local database, REST APIs).
*   **Presentation Layer (UI):**
    *   Flutter widgets for building the user interface.
    *   [flutter_hooks](https://pub.dev/packages/flutter_hooks) for managing ephemeral widget state and side effects efficiently.
*   **Data Modeling & Immutability:**
    *   [Freezed](https://pub.dev/packages/freezed) for generating immutable data models, unions, and boilerplate code (`copyWith`, `equals`, `hashCode`).
    *   [Equatable](https://pub.dev/packages/equatable) for simplified value equality in models where Freezed might not be used or for simpler classes.
*   **Dependency Injection:** Implicitly handled by Riverpod for providing dependencies throughout the widget tree and to business logic components.

## 🛠️ Tech Stack & Key Dependencies

*   **Framework:** [Flutter](https://flutter.dev/)
*   **Language:** [Dart](https://dart.dev/)
*   **State Management:** `flutter_riverpod`, `riverpod_annotation`, `hooks_riverpod`
*   **Navigation:** `go_router`
*   **Data Modeling & Immutability:** `freezed`, `freezed_annotation`, `json_serializable`, `equatable`
*   **Functional Programming (Error Handling):** `dartz`
*   **Local Widget State/Side Effects:** `flutter_hooks`
*   **HTTP Client:** `http` (with custom Riverpod Ref extension for debounced/auto-disposing clients)
*   **Local Storage:** `shared_preferences` (primarily for onboarding status and simple key-value persistence)
*   **Build Tools:** `build_runner` (for code generation: Riverpod, Freezed, JSON Serializable)
*   **Linting:** `flutter_lints` (or specify your lint package) along with `custom_lint` if used.

## 🚀 Getting Started

### Prerequisites

*   Flutter SDK (refer to `environment` in `pubspec.yaml` for version, e.g., `>=3.0.0`)
*   Dart SDK (comes with Flutter)
*   An IDE like Android Studio or VS Code with Flutter & Dart plugins installed.
*   (Optional, but recommended) Flutter Version Management (FVM) tool.

### Installation & Setup

1.  **Clone the repository:**
    //////////////////////////////

## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. 
Any contributions you make are greatly appreciated.
If you have a suggestion that would make this better, please fork the repo and create a pull request.
You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!
1.Fork the Project
2.Create your Feature Branch (git checkout -b feature/AmazingFeature)
3.Commit your Changes (git commit -m 'Add some AmazingFeature')
4.Push to the Branch (git push origin feature/AmazingFeature)
5.Open a Pull Request

## Licence

Distributed under the MIT License. See LICENSE file for more information.
