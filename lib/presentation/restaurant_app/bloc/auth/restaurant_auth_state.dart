part of 'restaurant_auth_bloc.dart';

sealed class RestaurantAuthState extends Equatable {
  const RestaurantAuthState();

  @override
  List<Object> get props => [];
}

final class RestaurantAuthInitial extends RestaurantAuthState {}

final class RestaurantAuthLoading extends RestaurantAuthState {}

final class RestaurantAuthSuccess extends RestaurantAuthState {
  final String restaurantId;

  const RestaurantAuthSuccess({required this.restaurantId});

  @override
  List<Object> get props => [restaurantId];
}

final class RestaurantAuthFailure extends RestaurantAuthState {
  final String message;

  const RestaurantAuthFailure({required this.message});

  @override
  List<Object> get props => [message];
}