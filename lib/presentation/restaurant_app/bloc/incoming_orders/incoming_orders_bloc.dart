import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_zomato/data/models/order_model.dart';
import 'package:mini_zomato/data/models/menu_item_model.dart';

part 'incoming_orders_event.dart';
part 'incoming_orders_state.dart';

class IncomingOrdersBloc extends Bloc<IncomingOrdersEvent, IncomingOrdersState> {
  IncomingOrdersBloc() : super(IncomingOrdersInitial()) {
    on<FetchIncomingOrders>(_onFetchIncomingOrders);
  }

  Future<void> _onFetchIncomingOrders(
    FetchIncomingOrders event,
    Emitter<IncomingOrdersState> emit,
  ) async {
    emit(IncomingOrdersLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));

      // Mock list of incoming orders for the restaurant.
      final List<Order> mockOrders = [
        Order(
          id: 'ZOMATO-11223',
          items:  [MenuItem.mockMenu[0], MenuItem.mockMenu[4]],
          totalPrice: 340.00,
          orderDate: DateTime.now().subtract(const Duration(minutes: 5)),
          status: OrderStatus.pending,
          restaurantName: 'The Golden Spoon', // This would be the restaurant's own name
        ),
        Order(
          id: 'ZOMATO-44556',
          items:  [MenuItem.mockMenu[1]],
          totalPrice: 350.00,
          orderDate: DateTime.now().subtract(const Duration(minutes: 12)),
          status: OrderStatus.pending,
          restaurantName: 'The Golden Spoon',
        ),
      ];

      emit(IncomingOrdersSuccess(mockOrders));
    } catch (e) {
      emit(IncomingOrdersFailure('Failed to fetch incoming orders: ${e.toString()}'));
    }
  }
}