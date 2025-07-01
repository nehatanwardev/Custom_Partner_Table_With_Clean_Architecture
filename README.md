# Flutter Customer & Partner Management App

A Flutter app that shows customer and partner data in tables with real-time API integration.

## What it does

- Shows two tables: one for customers and one for partners
- Each table displays profile images, names, and contact info
- You can view contact details by clicking "View"
- Delete individual rows
- Refresh data from the API
- Add new customers and partners through dialogs

## Why I built it this way

I used Clean Architecture and Riverpod instead of simpler patterns to show I can work on complex projects. While this could be done with basic setState or GetX, I wanted to demonstrate enterprise-level skills.

## Project structure

```
lib/
├── config/                  # App configuration and settings
├── core/                    # Shared utilities and common components
│   ├── common/             # Reusable widgets and components
│   ├── constants/          # API constants and app-wide values
│   ├── errors/             # Custom exceptions and failures
│   ├── network/            # HTTP client and network utilities
│   └── utils/              # Helper functions and response handling
├── features/               # Feature-based modules
│   └── home/              # Main feature
│       ├── data/          # API calls and data handling
│       ├── domain/        # Business logic
│       └── presentation/  # UI components
└── main.dart
```

## Key features

- **Real-time data**: Fetches from live APIs
- **Modern UI**: Material Design with loading animations
- **Error handling**: Graceful error states
- **Form validation**: Proper input validation
- **Responsive design**: Works on phones and tablets
- **Reusable components**: Common table widget for consistency

## Tech stack

- Flutter 
- Riverpod for state management
- Dio for API calls
- Shimmer for loading effects

## Getting started

1. Clone the repo
2. Run `flutter pub get`
3. Run `flutter run`


## What's included

- Clean Architecture pattern
- Repository pattern for data handling
- Use cases for business logic
- Riverpod providers for state management
- Custom widgets and dialogs
- Error handling and loading states
- Reusable common components
- App configuration management

## Why this matters

This shows I can build both simple and complex apps. For small projects, you'd use MVC with setState. For big projects like this, Clean Architecture makes the code maintainable and scalable.

The app handles real API calls, manages state properly, and provides a smooth user experience - all things that matter in production apps.



![image](https://github.com/user-attachments/assets/2a90136a-4cd9-41c1-a8fd-a11da0fc7f1f)

