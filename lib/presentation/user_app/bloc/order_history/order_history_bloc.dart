import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_zomato/data/models/order_model.dart';
import 'package:mini_zomato/data/models/menu_item_model.dart';

part 'order_history_event.dart';
part 'order_history_state.dart';

class OrderHistoryBloc extends Bloc<OrderHistoryEvent, OrderHistoryState> {
  OrderHistoryBloc() : super(OrderHistoryInitial()) {
    on<FetchOrderHistory>(_onFetchOrderHistory);
  }

  Future<void> _onFetchOrderHistory(
    FetchOrderHistory event,
    Emitter<OrderHistoryState> emit,
  ) async {
    emit(OrderHistoryLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));

      // Mock list of past orders.
      final List<Order> mockOrders = [
        Order(
          id: 'ZOMATO-54321',
          items: [MenuItem.mockMenu[1], MenuItem.mockMenu[3]],
          totalPrice: 530.00,
          orderDate: DateTime.now().subtract(const Duration(days: 1)),
          status: OrderStatus.delivered,
          restaurantName: 'The Golden Spoon',
        ),
        Order(
          id: 'ZOMATO-98765',
          items: [MenuItem.mockMenu[0], MenuItem.mockMenu[2], MenuItem.mockMenu[4]],
          totalPrice: 560.00,
          orderDate: DateTime.now().subtract(const Duration(days: 3)),
          status: OrderStatus.delivered,
          restaurantName: 'Pasta Paradise',
        ),
      ];

      emit(OrderHistorySuccess(mockOrders));
    } catch (e) {
      emit(OrderHistoryFailure('Failed to fetch order history: ${e.toString()}'));
    }
  }
}