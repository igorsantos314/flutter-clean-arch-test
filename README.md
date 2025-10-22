# Flutter Clean Architecture Test

A Flutter project demonstrating clean architecture principles with a user management system. This project showcases best practices for building scalable and maintainable Flutter applications.

## 🏗️ Architecture Overview

This project follows **Clean Architecture** principles, separating concerns into distinct layers:

### 📁 Project Structure

```
lib/
├── main.dart                    # Application entry point
├── core/                        # Core functionality
│   ├── database/                # Database configuration
│   ├── di/                      # Dependency injection
│   └── navigation/              # Routing configuration
├── domain/                      # Domain layer
│   └── common/                  # Shared domain logic
└── features/                    # Feature modules
    └── user/                    # User feature
        ├── data/                # Data layer
        │   ├── mapper/          # Data mappers
        │   └── repository/      # Repository implementations
        ├── domain/              # Domain layer
        │   ├── model/           # Domain models
        │   └── repository/      # Repository contracts
        ├── infra/               # Infrastructure layer
        │   └── local/           # Local data sources
        └── presentation/        # Presentation layer
            ├── cubit/           # State management
            ├── pages/           # UI screens
            └── states/          # State definitions
```

### 🔄 Architecture Layers

1. **Presentation Layer**: UI components, pages, and state management (Cubit/BLoC)
2. **Domain Layer**: Business logic, entities, and repository contracts
3. **Data Layer**: Repository implementations and data sources
4. **Infrastructure Layer**: External services, databases, and APIs

## 🚀 Features

- ✅ User Management (Create, Read, Update, Delete)
- ✅ Local SQLite Database with Drift
- ✅ Clean Architecture Implementation
- ✅ State Management with Cubit (flutter_bloc)
- ✅ Dependency Injection with GetIt
- ✅ Navigation with GoRouter
- ✅ Data Models with Freezed
- ✅ JSON Serialization
- ✅ Error Handling with Custom Error Types

## 🛠️ Technologies & Packages

### Core Dependencies
- **Flutter SDK**: ^3.8.1
- **flutter_bloc**: ^9.1.1 - State management
- **get_it**: ^8.2.0 - Dependency injection
- **go_router**: ^16.1.0 - Declarative routing
- **drift**: ^2.28.1 - Type-safe SQL database
- **freezed**: ^3.2.0 - Code generation for data classes
- **json_serializable**: ^6.10.0 - JSON serialization

### Development Dependencies
- **build_runner**: ^2.6.0 - Code generation
- **drift_dev**: ^2.28.1 - Drift code generation
- **flutter_lints**: ^5.0.0 - Linting rules

## 📋 Prerequisites

- Flutter SDK (^3.8.1)
- Dart SDK
- Android Studio / VS Code
- Git

## 🔧 Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/igorsantos314/flutter-clean-arch-test.git
cd flutter-clean-arch-test
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Generate Code
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### 4. Run the Application
```bash
flutter run
```

## 🏃‍♂️ Available Commands

### Code Generation
```bash
# Generate code (Freezed, JSON serialization, Drift)
flutter packages pub run build_runner build

# Watch for changes and auto-generate
flutter packages pub run build_runner watch

# Clean and regenerate
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### Testing
```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

### Code Quality
```bash
# Analyze code
flutter analyze

# Format code
flutter format .
```

## 🗄️ Database

This project uses **Drift** (formerly Moor) for local SQLite database management:

- **User Entity**: Stores user information (id, name, email, age, isActive)
- **Type-safe Queries**: Compile-time SQL query validation
- **Migration Support**: Database schema versioning

## 🧭 Navigation

The app uses **GoRouter** for declarative routing:

- `/` - User List Page (Home)
- `/add_user` - Add New User Page  
- `/manage_user/:userId` - Edit User Page

## 🔄 State Management

State management is handled using **Cubit** from the flutter_bloc package:

- `UserListCubit`: Manages user list state and operations
- `ManageUserCubit`: Handles user creation and editing

## 🏗️ Dependency Injection

Dependencies are managed using **GetIt** service locator:

- `AppLocator`: Main DI container setup
- `DatabaseLocator`: Database-related dependencies  
- `UserLocator`: User feature dependencies

## 📝 Code Generation

This project uses several code generators:

- **Freezed**: Generates immutable data classes with copyWith, equality, toString
- **JSON Serialization**: Generates toJson/fromJson methods
- **Drift**: Generates database access objects and queries

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Igor Santos**
- GitHub: [@igorsantos314](https://github.com/igorsantos314)

## 🙏 Acknowledgments

- Clean Architecture principles by Uncle Bob
- Flutter community for amazing packages
- Contributors and maintainers of used packages