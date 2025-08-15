part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

final class OrderPlacementInProgress extends OrderState {}

final class OrderPlacementSuccess extends OrderState {
  final String orderId;

  const OrderPlacementSuccess({required this.orderId});

  @override
  List<Object> get props => [orderId];
}

final class OrderPlacementFailure extends OrderState {
  final String message;

  const OrderPlacementFailure({required this.message});

  @override
  List<Object> get props => [message];
}