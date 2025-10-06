# tok_tok Project

## Overview
The `tok_tok` project is a Flutter application designed for social media interactions. It utilizes the Dio package for making HTTP requests and Hive for local storage management of user authentication tokens.

## Project Structure
```
tok_tok
├── lib
│   ├── main.dart                  # Entry point of the application
│   ├── data
│   │   ├── dio
│   │   │   ├── auth_dio.dart      # Configuration for Dio HTTP client
│   │   │   └── interceptors
│   │   │       └── token_interceptor.dart # Interceptor for handling tokens
│   │   └── service
│   │       └── local
│   │           └── auth_hive_service.dart # Local storage service for authentication
│   ├── screens
│   │   ├── splash_page.dart        # Splash page for token validation
│   │   └── home_page.dart          # Home page displayed after authentication
│   └── utils
│       └── constants
│           └── api_keys.dart       # API keys constants
├── pubspec.yaml                    # Flutter project configuration
└── README.md                       # Project documentation
```

## Features
- **Token Management**: The application securely manages user tokens using Hive.
- **API Integration**: Utilizes Dio for making API requests with built-in token handling.
- **Splash Screen**: Checks for user authentication status and navigates accordingly.

## Getting Started
1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. Use `flutter run` to start the application.

## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any enhancements or bug fixes.

## License
This project is licensed under the MIT License. See the LICENSE file for details.