part of 'incoming_orders_bloc.dart';

sealed class IncomingOrdersEvent extends Equatable {
  const IncomingOrdersEvent();

  @override
  List<Object> get props => [];
}

class FetchIncomingOrders extends IncomingOrdersEvent {}