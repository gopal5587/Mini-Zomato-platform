<div align="center">

# 🚀 Mini Zomato - Flutter Food Delivery Platform
A complete food delivery ecosystem built with Flutter & BLoC
Streamlining the entire ordering lifecycle — from restaurant browsing to order placement, management, and delivery.

</div>

## 👥 Team
<table align="center">
<tr>
<td align="center"><strong>🎯 Gopal</strong><br><em>Project Lead & Developer</em></td>
</tr>
</table>

## 📌 Project Overview
Mini Zomato is a comprehensive food delivery system that revolutionizes the ordering experience for users, restaurants, and delivery partners. Built with modern mobile technologies, it provides a clean user interface, robust state management using the BLoC pattern, and a scalable, feature-driven architecture.

## 🎯 What Makes Mini Zomato Special?
✅ Triple-App Architecture - Separate, tailored experiences for Customers, Restaurant Owners, and Delivery Partners within a single ecosystem.

✅ Robust State Management - Utilizes the BLoC pattern for predictable and maintainable state logic, ensuring a smooth and responsive user experience.

✅ Clean Architecture - A clear separation of concerns between the UI (Presentation), business logic (BLoC), and data layers, making the codebase scalable and easy to manage.

✅ Mock-First Development - Built and tested with mock data, allowing for complete UI and logic validation without backend dependencies.

## 🛠 Technology Stack
<div align="center">

## Mobile Ecosystem
State Management & Tooling
</div>

## ⚡ Core Features
<div align="center">

📱 User App

🏪 Restaurant App

🛵 Delivery Partner App

Secure User Login

Restaurant Partner Login

Delivery Partner Login

Restaurant Discovery

Incoming Order Dashboard

View Assigned Orders

Detailed Menu Viewing

Accept/Reject Orders

Update Delivery Status

Cart Management

Full Menu Management

Mock Navigation View

Seamless Order Placement

Add, Edit & Delete Items



Past Order History





</div>

🎯 User Experiences
👤 Customer Journey:

🔐 Log in securely to the platform.

🍽 Browse a list of available restaurants.

📜 View detailed menus and add items to the cart.

🛒 Manage items in the cart and see the total price update in real-time.

✅ Place the order and receive a confirmation.

📄 View a complete history of all past orders.

👨‍💼 Restaurant Owner Journey:

🔐 Log in to the restaurant partner dashboard.

🔔 View a list of new, incoming orders from customers.

👍👎 Accept or reject orders with the tap of a button.

📝 Access the menu management screen to view the current menu.

➕ Add new items or 🗑 delete existing items from the menu.

🛵 Delivery Partner Journey:

🔐 Log in to the delivery partner portal.

🗺 View a list of assigned orders with pickup and delivery details.

🗺 Open a mock navigation view to see the delivery route.

✅ Mark orders as "Delivered" to update their status.

📁 Project Architecture
The project follows a clean, feature-driven folder structure that separates concerns effectively.

mini_zomato/
└── lib/
    ├── data/
    │   └── models/
    │       ├── user_model.dart
    │       ├── restaurant_model.dart
    │       ├── menu_item_model.dart
    │       └── order_model.dart
    │
    └── presentation/
        ├── user_app/
        │   ├── bloc/
        │   └── screens/
        │
        ├── restaurant_app/
        │   ├── bloc/
        │   └── screens/
        │
        └── delivery_partner_app/
            ├── bloc/
            └── screens/

🚀 Quick Start Guide
📋 Prerequisites
Flutter SDK (version 3.x or higher)

An IDE like VS Code or Android Studio

A running emulator or a physical device

⚙ Installation & Setup
Clone the repository

git clone https://github.com/your-username/mini-zomato-platform.git
cd mini-zomato-platform

Install dependencies

flutter pub get

Run the application

flutter run

🧪 Testing the Apps
To test a specific app, open lib/main.dart and set the home property to the desired login screen.

👤 User App:

Screen: UserLoginScreen()

Credentials: Any non-empty email and a password of 6+ characters.

👨‍💼 Restaurant App:

Screen: RestaurantLoginScreen()

Credentials: test@restaurant.com / password

🛵 Delivery Partner App:

Screen: DeliveryPartnerLoginScreen()

Credentials: partner@test.com / password

🤝 Contributing
Contributions are welcome! Please feel free to open an issue or submit a pull request.

Fork the repository

Create your feature branch (git checkout -b feature/AmazingFeature)

Commit your changes (git commit -m 'Add some AmazingFeature')

Push to the branch (git push origin feature/AmazingFeature)

Open a Pull Request

📄 License
This project is licensed under the MIT License - see the LICENSE file for details.

<div align="center">

🌟 Star this repository if you found it helpful!
Built with ❤ by Gopal

</div>
