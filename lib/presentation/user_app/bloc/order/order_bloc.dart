import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_zomato/data/models/menu_item_model.dart';
import 'dart:math';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<PlaceOrder>(_onPlaceOrder);
  }

  Future<void> _onPlaceOrder(
    PlaceOrder event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderPlacementInProgress());
    try {
      // Simulate a network call to place the order.
      await Future.delayed(const Duration(seconds: 2));

      if (event.cartItems.isEmpty) {
        emit(const OrderPlacementFailure(message: 'Cannot place an empty order.'));
        return;
      }

      // Generate a random mock order ID.
      final orderId = 'ZOMATO-${Random().nextInt(99999)}';
      print('Order placed successfully with ID: $orderId');

      emit(OrderPlacementSuccess(orderId: orderId));
    } catch (e) {
      emit(OrderPlacementFailure(message: 'Failed to place order: ${e.toString()}'));
    }
  }
}