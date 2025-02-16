# Product Listing App

A Flutter application that displays a list of products with filtering capabilities.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)

## Introduction

The Product Listing App is designed to showcase a collection of products, allowing users to filter them based on categories and price ranges. It's built using Flutter and implements the BLoC pattern for state management.

## Features

- Display a list of products with images, names, prices, and ratings.
- Filter products by category and price range.
- Responsive UI with caching and shimmer effects for image loading.

## Demo

https://github.com/user-attachments/assets/778055de-6a89-4941-928d-bf40f5b9e953

## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Siddiqui145/product_listing_app.git
   cd product_listing_app
   ```

2. **Install dependencies:**

   Ensure you have Flutter installed. Then, run:

   ```bash
   flutter pub get
   ```

3. **Run the application:**

   ```bash
   flutter run
   ```

## Usage

- **Home Screen:** Browse through the list of products.
- **Search Bar:** Use the search functionality to find products by name.
- **Filters:** Apply filters to narrow down products by category and price.

## Project Structure

```plaintext
lib/
├── blocs/
│   ├── filter_bloc.dart
│   ├── filter_event.dart
│   └── filter_state.dart
├── models/
│   └── product.dart
├── repositories/
│   └── product_repository.dart
├── screens/
│   └── home_screen.dart
├── widgets/
│   ├── product_card.dart
│   └── custom_search_bar.dart
└── main.dart
```

- `blocs/`: Contains BLoC classes for managing state.
- `models/`: Defines data structures, such as the `Product` model.
- `repositories/`: Handles data fetching and storage.
- `screens/`: UI screens of the application.
- `widgets/`: Reusable UI components.
- `main.dart`: Entry point of the application.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for any enhancements or bug fixes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
