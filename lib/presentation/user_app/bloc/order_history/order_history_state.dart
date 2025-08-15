part of 'order_history_bloc.dart';

sealed class OrderHistoryState extends Equatable {
  const OrderHistoryState();

  @override
  List<Object> get props => [];
}

final class OrderHistoryInitial extends OrderHistoryState {}

final class OrderHistoryLoading extends OrderHistoryState {}

final class OrderHistorySuccess extends OrderHistoryState {
  final List<Order> orders;

  const OrderHistorySuccess(this.orders);

  @override
  List<Object> get props => [orders];
}

final class OrderHistoryFailure extends OrderHistoryState {
  final String message;

  const OrderHistoryFailure(this.message);

  @override
  List<Object> get props => [message];
}