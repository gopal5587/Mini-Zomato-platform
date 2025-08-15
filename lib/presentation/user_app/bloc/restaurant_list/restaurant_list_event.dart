part of 'restaurant_list_bloc.dart';

sealed class RestaurantListEvent extends Equatable {
  const RestaurantListEvent();

  @override
  List<Object> get props => [];
}

// Event to trigger fetching the list of restaurants.
class FetchRestaurants extends RestaurantListEvent {}