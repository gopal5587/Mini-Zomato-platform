part of 'delivery_auth_bloc.dart';

sealed class DeliveryAuthState extends Equatable {
  const DeliveryAuthState();

  @override
  List<Object> get props => [];
}

final class DeliveryAuthInitial extends DeliveryAuthState {}

final class DeliveryAuthLoading extends DeliveryAuthState {}

final class DeliveryAuthSuccess extends DeliveryAuthState {
  final String partnerId;

  const DeliveryAuthSuccess({required this.partnerId});

  @override
  List<Object> get props => [partnerId];
}

final class DeliveryAuthFailure extends DeliveryAuthState {
  final String message;

  const DeliveryAuthFailure({required this.message});

  @override
  List<Object> get props => [message];
}