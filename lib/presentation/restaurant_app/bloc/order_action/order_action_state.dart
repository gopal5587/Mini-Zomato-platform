part of 'order_action_bloc.dart';

sealed class OrderActionState extends Equatable {
  const OrderActionState();

  @override
  List<Object> get props => [];
}

final class OrderActionInitial extends OrderActionState {}

final class OrderActionInProgress extends OrderActionState {}

// State for when an action (accept/reject) is successful.
final class OrderActionSuccess extends OrderActionState {
  final String orderId;
  final String message;

  const OrderActionSuccess({required this.orderId, required this.message});

  @override
  List<Object> get props => [orderId, message];
}

final class OrderActionFailure extends OrderActionState {
  final String message;

  const OrderActionFailure(this.message);

  @override
  List<Object> get props => [message];
}