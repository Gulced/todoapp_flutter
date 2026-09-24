# Layered Flutter Todo Client

A structured Flutter REST client demonstrating authenticated application architecture beyond a basic todo interface.

## Overview

A structured Flutter REST client demonstrating authenticated application architecture beyond a basic todo interface. The description and capabilities in this document are limited to behavior that can be verified in the repository source.

## Key Features

- Bloc-based login and signup flows
- Formz input validation
- Generated Retrofit/Dio API clients
- Authentication token interceptor
- Secure token storage
- Dependency injection and typed JSON models
- Turkish and English localization

## Tech Stack

- Dart
- Flutter
- Bloc
- Dio
- Retrofit
- GetIt
- Injectable
- Formz
- GoRouter
- Secure Storage
- SharedPreferences

## Architecture

The project separates core infrastructure, authentication presentation, data clients/models, and domain repositories. GetIt/Injectable provides dependency wiring.

## Project Structure

- `lib/core/` — DI, routing, validation, storage, theme, and localization
- `lib/auth/` — views and authentication blocs
- `lib/data/` — REST clients and serialized models
- `lib/domain/` — repository abstractions

## Getting Started

Run the commands appropriate to the project root:

```bash
flutter pub get
flutter run
```

## Environment Variables

Configure these names through local environment/configuration files. Do not commit secret values.

```env
API_BASE_URL=
```

## Testing

```bash
flutter test
```

## Technical Highlights

- Bloc and validated authentication state
- Generated typed REST clients
- Token interception and secure storage
- Dependency injection and localization

## Possible Improvements

- Add or expand automated tests around core workflows.
- Document deployment and environment-specific configuration.
- Add CI checks for build, linting, and tests where they are not already present.
