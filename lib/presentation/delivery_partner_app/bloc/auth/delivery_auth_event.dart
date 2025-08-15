part of 'delivery_auth_bloc.dart';

sealed class DeliveryAuthEvent extends Equatable {
  const DeliveryAuthEvent();

  @override
  List<Object> get props => [];
}

class DeliveryLoginRequested extends DeliveryAuthEvent {
  final String email;
  final String password;

  const DeliveryLoginRequested({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class DeliveryLogoutRequested extends DeliveryAuthEvent {}