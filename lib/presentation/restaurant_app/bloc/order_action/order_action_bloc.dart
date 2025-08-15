import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_action_event.dart';
part 'order_action_state.dart';

class OrderActionBloc extends Bloc<OrderActionEvent, OrderActionState> {
  OrderActionBloc() : super(OrderActionInitial()) {
    on<AcceptOrder>(_onAcceptOrder);
    on<RejectOrder>(_onRejectOrder);
  }

  Future<void> _onAcceptOrder(
    AcceptOrder event,
    Emitter<OrderActionState> emit,
  ) async {
    emit(OrderActionInProgress());
    try {
      await Future.delayed(const Duration(seconds: 1));
      print('Order ${event.orderId} Accepted on the backend.');
      emit(OrderActionSuccess(orderId: event.orderId, message: 'Order Accepted'));
    } catch (e) {
      emit(OrderActionFailure('Failed to accept order: ${e.toString()}'));
    }
  }

  Future<void> _onRejectOrder(
    RejectOrder event,
    Emitter<OrderActionState> emit,
  ) async {
    emit(OrderActionInProgress());
    try {
      await Future.delayed(const Duration(seconds: 1));
      print('Order ${event.orderId} Rejected on the backend.');
      emit(OrderActionSuccess(orderId: event.orderId, message: 'Order Rejected'));
    } catch (e) {
      emit(OrderActionFailure('Failed to reject order: ${e.toString()}'));
    }
  }
}