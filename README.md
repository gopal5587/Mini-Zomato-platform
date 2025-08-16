<div align="center">

# 🚀 Mini Zomato - Flutter Food Delivery Platform  
A complete food delivery ecosystem built with Flutter & BLoC  
Streamlining the entire ordering lifecycle — from restaurant browsing to order placement, management, and delivery.

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)
![BLoC](https://img.shields.io/badge/State%20Management-BLoC-green)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

</div>

---

## 🔗 Quick Links
- [👥 Team](#-team)
- [📌 Project Overview](#-project-overview)
- [✨ Key Highlights](#-what-makes-mini-zomato-special)
- [⚡ Core Features](#-core-features)
- [🎯 User Experiences](#-user-experiences)
- [📁 Project Architecture](#-project-architecture)
- [🚀 Quick Start Guide](#-quick-start-guide)
- [🧪 Testing the Apps](#-testing-the-apps)
- [📸 Screenshots](#-screenshots-coming-soon)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)

---

## 👥 Team
<table align="center">
<tr>
<td align="center"><strong>🎯 Gopal</strong><br><em>Project Lead & Developer</em></td>
</tr>
</table>

---

## 📌 Project Overview
*Mini Zomato* is a complete food delivery ecosystem built with *Flutter* & *BLoC* that provides a seamless experience for *Customers, Restaurant Owners, and Delivery Partners*.  

It features:  
- Modern & responsive *UI/UX*  
- Robust *state management* with BLoC  
- Scalable *feature-driven architecture*  
- Built with a *mock-first development* approach for testing without backend dependencies  

---

## ✨ What Makes Mini Zomato Special?
✅ *Triple-App Architecture* — Tailored apps for Customers, Restaurant Owners, and Delivery Partners within a single project.  

✅ *Robust State Management* — Built with BLoC for predictable and maintainable state logic.  

✅ *Clean Architecture* — Proper separation of UI, Business Logic, and Data layers.  

✅ *Mock-First Development* — Fully testable UI and flows without backend integration.  

---

## ⚡ Core Features
<div align="center">

### 📱 User App
- Secure User Login  
- Restaurant Discovery  
- Detailed Menu Viewing  
- Cart Management  
- Seamless Order Placement  
- Past Order History  

### 🏪 Restaurant App
- Restaurant Partner Login  
- Incoming Order Dashboard  
- Accept / Reject Orders  
- Full Menu Management (Add, Edit, Delete)  

### 🛵 Delivery Partner App
- Delivery Partner Login  
- Assigned Orders Dashboard  
- Mock Navigation View  
- Update Delivery Status  

</div>

---

## 🎯 User Experiences

### 👤 Customer Journey
1. 🔐 Log in securely  
2. 🍽 Browse restaurants  
3. 📜 View menus & add items to cart  
4. 🛒 Manage cart with real-time updates  
5. ✅ Place orders & get confirmations  
6. 📄 View complete past order history  

### 👨‍💼 Restaurant Owner Journey
1. 🔐 Log in to partner dashboard  
2. 🔔 View incoming orders  
3. 👍👎 Accept or reject orders  
4. 📝 Manage menu (Add/Delete items)  

### 🛵 Delivery Partner Journey
1. 🔐 Log in to partner portal  
2. 🗺 View assigned orders with pickup & delivery details  
3. 📍 Use mock navigation for delivery  
4. ✅ Mark orders as “Delivered”  

---

## 📁 Project Architecture

```bash
mini_zomato/
├── lib/
│   ├── main.dart
│   │
│   ├── core/                  # Core utilities, constants, and theme
│   │   ├── constants/
│   │   │   └── app_constants.dart
│   │   ├── theme/
│   │   │   └── app_theme.dart
│   │   └── utils/
│   │       └── ...
│   │
│   ├── data/                  # Data layer: repositories, models, data sources
│   │   ├── models/
│   │   │   ├── user_model.dart
│   │   │   ├── restaurant_model.dart
│   │   │   ├── menu_item_model.dart
│   │   │   ├── order_model.dart
│   │   │   └── ...
│   │   │
│   │   ├── repositories/
│   │   │   ├── auth_repository.dart
│   │   │   ├── restaurant_repository.dart
│   │   │   └── order_repository.dart
│   │   │
│   │   └── data_sources/
│   │       ├── remote/
│   │       │   └── api_service.dart  # For network requests
│   │       └── local/
│   │           └── ...             # For local data if needed
│   │
│   ├── presentation/          # UI Layer: Screens, Widgets, and BLoCs
│   │   │
│   │   ├── user_app/
│   │   │   ├── bloc/
│   │   │   │   ├── auth/
│   │   │   │   │   ├── auth_bloc.dart
│   │   │   │   │   ├── auth_event.dart
│   │   │   │   │   └── auth_state.dart
│   │   │   │   ├── restaurant_list/
│   │   │   │   │   └── ...
│   │   │   │   ├── menu/
│   │   │   │   │   └── ...
│   │   │   │   ├── cart/
│   │   │   │   │   └── ...
│   │   │   │   ├── order/
│   │   │   │   │   └── ...
│   │   │   │   └── order_history/
│   │   │   │       └── ...
│   │   │   │
│   │   │   ├── screens/
│   │   │   │   ├── login_screen.dart
│   │   │   │   ├── home_screen.dart
│   │   │   │   ├── restaurant_details_screen.dart
│   │   │   │   ├── cart_screen.dart
│   │   │   │   └── my_orders_screen.dart
│   │   │   │
│   │   │   └── widgets/
│   │   │       ├── restaurant_card.dart
│   │   │       └── menu_item.dart
│   │   │
│   │   ├── restaurant_app/
│   │   │   ├── bloc/
│   │   │   │   ├── auth/
│   │   │   │   │   └── ...
│   │   │   │   ├── incoming_orders/
│   │   │   │   │   └── ...
│   │   │   │   ├── order_action/
│   │   │   │   │   └── ...
│   │   │   │   └── menu_management/
│   │   │   │       └── ...
│   │   │   │
│   │   │   ├── screens/
│   │   │   │   ├── login_screen.dart
│   │   │   │   ├── dashboard_screen.dart
│   │   │   │   └── menu_management_screen.dart
│   │   │   │
│   │   │   └── widgets/
│   │   │       └── order_card.dart
│   │   │
│   │   └── delivery_partner_app/
│   │       ├── bloc/
│   │       │   ├── auth/
│   │       │   │   └── ...
│   │       │   ├── delivery_orders/
│   │       │   │   └── ...
│   │       │   ├── delivery_status/
│   │       │   │   └── ...
│   │       │   └── map/
│   │       │       └── ...
│   │       │
│   │       ├── screens/
│   │       │   ├── login_screen.dart
│   │       │   ├── assigned_orders_screen.dart
│   │       │   └── navigation_screen.dart
│   │       │
│   │       └── widgets/
│   │           └── delivery_task_card.dart
│
└── pubspec.yaml
```
## 🚀 Quick Start Guide

Follow these steps to set up the project locally:

```bash
# Clone the repository
git clone https://github.com/your-username/mini-zomato-platform.git

# Navigate to the project directory
cd mini-zomato-platform

# Get Flutter dependencies
flutter pub get

# Run the User app (repeat for other apps)
flutter run
```
