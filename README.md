Mini Zomato - Flutter BLoC Food Delivery Platform
A comprehensive food delivery ecosystem built with Flutter, featuring three distinct applications for users, restaurants, and delivery partners. This project demonstrates a clean, scalable architecture using the BLoC pattern for state management.

📖 Project Overview
The objective of this project is to develop a basic, yet functional, food delivery system that mimics the core functionalities of platforms like Zomato or Swiggy. The system is divided into three separate mobile applications, each tailored to its specific user role:

User App: Allows customers to browse restaurants, view menus, place orders, and track their order history.

Restaurant App: Enables restaurant owners to manage their menu, view incoming orders, and accept or reject them.

Delivery Partner App: Provides delivery personnel with a list of assigned orders, delivery details, and the ability to update order status.

This project emphasizes clean architecture, modularity, and robust state management using the BLoC pattern.

✨ Features
📱 User App (Customer)
[x] Authentication: Secure login flow for users.

[x] Restaurant Listing: Fetches and displays a list of available restaurants.

[x] Menu Viewing: View detailed menus for each restaurant.

[x] Cart Management: Add/remove items from the cart and view the total price.

[x] Order Placement: Place food orders from the cart.

[x] Order History: View a list of past orders.

🏪 Restaurant App
[x] Authentication: Secure login for restaurant partners.

[x] Order Dashboard: View a real-time list of incoming customer orders.

[x] Order Status Control: Accept or reject new orders.

[x] Menu Management: Add, edit, or delete menu items.

🛵 Delivery Partner App
[x] Authentication: Secure login for delivery partners.

[x] Assigned Orders: View a list of current delivery tasks.

[x] Order Status Update: Mark orders as "Picked Up" or "Delivered".

[x] Navigation: Basic map interface to view the delivery route (mocked).

🛠 Tech Stack & Architecture
Core Technologies
Framework: Flutter 3.x

Language: Dart

State Management: BLoC (flutter_bloc package)

Value Equality: equatable

Date Formatting: intl

Architecture: BLoC & Clean Architecture
This project follows a clean, scalable architecture inspired by the principles of Clean Architecture, tailored for a Flutter BLoC implementation. The codebase is organized into distinct layers to separate concerns, making it easier to maintain, test, and scale.

lib/

data/ (Data Layer):

models/: Contains the plain Dart objects (e.g., UserModel, Restaurant, Order) that represent the application's data structure.

repositories/: (Conceptual) Abstract contracts for fetching and manipulating data.

data_sources/: (Conceptual) Concrete implementations for fetching data, whether from a remote API or a local database. For this project, this layer is mocked directly within the BLoCs.

presentation/ (Presentation Layer):

bloc/: The heart of the application's business logic. Each feature has its own BLoC, which manages state by processing events and emitting new states.

screens/: The UI widgets that represent full pages in the application. These widgets listen to BLoC state changes and rebuild accordingly.

widgets/: Reusable smaller UI components (e.g., RestaurantCard, MenuItem) used across different screens.

core/: (Conceptual) Contains shared utilities, constants, themes, or extensions used throughout the application.

This structure ensures that the UI (screens) is completely decoupled from the data sources, with the bloc layer acting as the bridge between them.

🚀 Getting Started
Prerequisites
Flutter SDK (version 3.x or higher)

Dart SDK

An IDE like VS Code or Android Studio

A running emulator or a physical device

Installation & Setup
Clone the repository:

git clone https://github.com/your-username/mini-zomato-flutter.git
cd mini-zomato-flutter

Install dependencies:

flutter pub get

Run the application:

flutter run

🧪 How to Test
The application is built with mock data, so no backend setup is required for testing. To test a specific app, you need to set it as the initial screen in lib/main.dart.

To Test the User App:
In lib/main.dart, set home: const UserLoginScreen().

Run the app.

Credentials: Use any non-empty email and a password of 6+ characters.

To Test the Restaurant App:
In lib/main.dart, set home: const RestaurantLoginScreen().

Run the app.

Credentials:

Email: test@restaurant.com

Password: password

To Test the Delivery Partner App:
In lib/main.dart, set home: const DeliveryPartnerLoginScreen().

Run the app.

Credentials:

Email: partner@test.com

Password: password

🔮 Future Improvements (Bonus Features)
This project provides a solid foundation. The following features can be added to make it a production-ready application:

Firebase Integration: Replace mock data with Firebase (Auth, Firestore) for a real-time backend.

Push Notifications: Implement notifications for order status updates (e.g., "Your order has been accepted").

Real-time Updates: Use streams from Firestore to update the UI in real-time without manual refreshing.

Responsive UI: Ensure the design is fully responsive for different screen sizes (mobile/tablet).

Live Location Tracking: Integrate a map service like Google Maps for live delivery tracking.

Unit & Widget Testing: Write comprehensive tests for BLoCs and widgets.