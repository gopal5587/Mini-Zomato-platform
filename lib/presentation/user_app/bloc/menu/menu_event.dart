part of 'menu_bloc.dart';

sealed class MenuEvent extends Equatable {
  const MenuEvent();

  @override
  List<Object> get props => [];
}

// Event to fetch the menu for a specific restaurant.
class FetchMenu extends MenuEvent {
  final String restaurantId;

  const FetchMenu({required this.restaurantId});

  @override
  List<Object> get props => [restaurantId];
}