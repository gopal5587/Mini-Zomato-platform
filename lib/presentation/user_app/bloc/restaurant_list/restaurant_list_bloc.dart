import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart'; // Corrected this line
import 'package:mini_zomato/data/models/restaurant_model.dart';

part 'restaurant_list_event.dart';
part 'restaurant_list_state.dart';

class RestaurantListBloc
    extends Bloc<RestaurantListEvent, RestaurantListState> {
  RestaurantListBloc() : super(RestaurantListInitial()) {
    on<FetchRestaurants>(_onFetchRestaurants);
  }

  Future<void> _onFetchRestaurants(
    FetchRestaurants event,
    Emitter<RestaurantListState> emit,
  ) async {
    emit(RestaurantListLoading());
    try {
      // Simulate a network delay.
      await Future.delayed(const Duration(seconds: 1));

      // In a real app, you would fetch this from a repository.
      // For now, we use the mock data from our model.
      final restaurants = Restaurant.mockRestaurants;

      emit(RestaurantListSuccess(restaurants));
    } catch (e) {
      emit(RestaurantListFailure('Failed to fetch restaurants: ${e.toString()}'));
    }
  }
}