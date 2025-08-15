part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class PlaceOrder extends OrderEvent {
  final Map<MenuItem, int> cartItems;
  final double totalPrice;

  const PlaceOrder({required this.cartItems, required this.totalPrice});

  @override
  List<Object> get props => [cartItems, totalPrice];
}