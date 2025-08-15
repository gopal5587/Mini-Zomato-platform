import 'package:equatable/equatable.dart';
import 'package:mini_zomato/data/models/menu_item_model.dart';

enum OrderStatus {
  pending,
  confirmed,
  preparing,
  outForDelivery,
  delivered,
  cancelled,
}

class Order extends Equatable {
  final String id;
  final List<MenuItem> items;
  final double totalPrice;
  final DateTime orderDate;
  final OrderStatus status;
  final String restaurantName; // Example additional detail

  const Order({
    required this.id,
    required this.items,
    required this.totalPrice,
    required this.orderDate,
    required this.status,
    required this.restaurantName,
  });

  @override
  List<Object?> get props => [id, items, totalPrice, orderDate, status, restaurantName];
}