part of 'incoming_orders_bloc.dart';

sealed class IncomingOrdersState extends Equatable {
  const IncomingOrdersState();

  @override
  List<Object> get props => [];
}

final class IncomingOrdersInitial extends IncomingOrdersState {}

final class IncomingOrdersLoading extends IncomingOrdersState {}

final class IncomingOrdersSuccess extends IncomingOrdersState {
  final List<Order> orders;

  const IncomingOrdersSuccess(this.orders);

  @override
  List<Object> get props => [orders];
}

final class IncomingOrdersFailure extends IncomingOrdersState {
  final String message;

  const IncomingOrdersFailure(this.message);

  @override
  List<Object> get props => [message];
}