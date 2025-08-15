part of 'delivery_orders_bloc.dart';

sealed class DeliveryOrdersState extends Equatable {
  const DeliveryOrdersState();

  @override
  List<Object> get props => [];
}

final class DeliveryOrdersInitial extends DeliveryOrdersState {}

final class DeliveryOrdersLoading extends DeliveryOrdersState {}

final class DeliveryOrdersSuccess extends DeliveryOrdersState {
  final List<Order> orders;

  const DeliveryOrdersSuccess(this.orders);

  @override
  List<Object> get props => [orders];
}

final class DeliveryOrdersFailure extends DeliveryOrdersState {
  final String message;

  const DeliveryOrdersFailure(this.message);

  @override
  List<Object> get props => [message];
}