import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'restaurant_auth_event.dart';
part 'restaurant_auth_state.dart';

class RestaurantAuthBloc extends Bloc<RestaurantAuthEvent, RestaurantAuthState> {
  RestaurantAuthBloc() : super(RestaurantAuthInitial()) {
    on<RestaurantLoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(
    RestaurantLoginRequested event,
    Emitter<RestaurantAuthState> emit,
  ) async {
    emit(RestaurantAuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));

      if (event.email == 'test@restaurant.com' && event.password == 'password') {
        // Mock successful login
        emit(const RestaurantAuthSuccess(restaurantId: 'restaurant_abc_789'));
      } else {
        emit(const RestaurantAuthFailure(message: 'Invalid credentials for restaurant.'));
      }
    } catch (e) {
      emit(RestaurantAuthFailure(message: 'An error occurred: ${e.toString()}'));
    }
  }
}