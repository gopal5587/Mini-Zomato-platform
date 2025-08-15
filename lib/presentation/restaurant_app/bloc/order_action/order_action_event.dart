part of 'order_action_bloc.dart';

sealed class OrderActionEvent extends Equatable {
  const OrderActionEvent();

  @override
  List<Object> get props => [];
}

class AcceptOrder extends OrderActionEvent {
  final String orderId;

  const AcceptOrder(this.orderId);

  @override
  List<Object> get props => [orderId];
}

class RejectOrder extends OrderActionEvent {
  final String orderId;

  const RejectOrder(this.orderId);

  @override
  List<Object> get props => [orderId];
}