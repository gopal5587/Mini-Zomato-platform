import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_zomato/data/models/order_model.dart';
import 'package:mini_zomato/data/models/menu_item_model.dart';

part 'delivery_orders_event.dart';
part 'delivery_orders_state.dart';

class DeliveryOrdersBloc extends Bloc<DeliveryOrdersEvent, DeliveryOrdersState> {
  DeliveryOrdersBloc() : super(DeliveryOrdersInitial()) {
    on<FetchAssignedOrders>(_onFetchAssignedOrders);
  }

  Future<void> _onFetchAssignedOrders(
    FetchAssignedOrders event,
    Emitter<DeliveryOrdersState> emit,
  ) async {
    emit(DeliveryOrdersLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));

      // Mock list of orders assigned to the delivery partner.
      final List<Order> mockOrders = [
        Order(
          id: 'ZOMATO-11223',
          items:  [MenuItem.mockMenu[0], MenuItem.mockMenu[4]],
          totalPrice: 340.00,
          orderDate: DateTime.now().subtract(const Duration(minutes: 15)),
          status: OrderStatus.outForDelivery,
          restaurantName: 'The Golden Spoon',
        ),
      ];

      emit(DeliveryOrdersSuccess(mockOrders));
    } catch (e) {
      emit(DeliveryOrdersFailure('Failed to fetch assigned orders: ${e.toString()}'));
    }
  }
}