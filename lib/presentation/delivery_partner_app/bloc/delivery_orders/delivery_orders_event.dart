part of 'delivery_orders_bloc.dart';

sealed class DeliveryOrdersEvent extends Equatable {
  const DeliveryOrdersEvent();

  @override
  List<Object> get props => [];
}

class FetchAssignedOrders extends DeliveryOrdersEvent {}