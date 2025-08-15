part of 'delivery_status_bloc.dart';

sealed class DeliveryStatusState extends Equatable {
  const DeliveryStatusState();

  @override
  List<Object> get props => [];
}

final class DeliveryStatusInitial extends DeliveryStatusState {}

final class DeliveryStatusUpdateInProgress extends DeliveryStatusState {}

final class DeliveryStatusUpdateSuccess extends DeliveryStatusState {
  final String orderId;

  const DeliveryStatusUpdateSuccess(this.orderId);

  @override
  List<Object> get props => [orderId];
}

final class DeliveryStatusUpdateFailure extends DeliveryStatusState {
  final String message;

  const DeliveryStatusUpdateFailure(this.message);

  @override
  List<Object> get props => [message];
}