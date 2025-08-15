part of 'restaurant_list_bloc.dart';

sealed class RestaurantListState extends Equatable {
  const RestaurantListState();

  @override
  List<Object> get props => [];
}

final class RestaurantListInitial extends RestaurantListState {}

final class RestaurantListLoading extends RestaurantListState {}

// State when the restaurants have been successfully fetched.
// It holds the list of restaurants.
final class RestaurantListSuccess extends RestaurantListState {
  final List<Restaurant> restaurants;

  const RestaurantListSuccess(this.restaurants);

  @override
  List<Object> get props => [restaurants];
}

// State when there's an error fetching the restaurants.
final class RestaurantListFailure extends RestaurantListState {
  final String message;

  const RestaurantListFailure(this.message);

  @override
  List<Object> get props => [message];
}