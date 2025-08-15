import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_zomato/data/models/order_model.dart';

part 'delivery_status_event.dart';
part 'delivery_status_state.dart';

class DeliveryStatusBloc extends Bloc<DeliveryStatusEvent, DeliveryStatusState> {
  DeliveryStatusBloc() : super(DeliveryStatusInitial()) {
    on<UpdateDeliveryStatus>(_onUpdateStatus);
  }

  Future<void> _onUpdateStatus(
    UpdateDeliveryStatus event,
    Emitter<DeliveryStatusState> emit,
  ) async {
    emit(DeliveryStatusUpdateInProgress());
    try {
      // Simulate a network call to update the order status.
      await Future.delayed(const Duration(seconds: 1));
      print('Order ${event.orderId} status updated to ${event.newStatus} on the backend.');

      emit(DeliveryStatusUpdateSuccess(event.orderId));
    } catch (e) {
      emit(DeliveryStatusUpdateFailure('Failed to update status: ${e.toString()}'));
    }
  }
}