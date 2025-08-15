part of 'delivery_status_bloc.dart';

sealed class DeliveryStatusEvent extends Equatable {
  const DeliveryStatusEvent();

  @override
  List<Object> get props => [];
}

class UpdateDeliveryStatus extends DeliveryStatusEvent {
  final String orderId;
  final OrderStatus newStatus;

  const UpdateDeliveryStatus({required this.orderId, required this.newStatus});

  @override
  List<Object> get props => [orderId, newStatus];
}