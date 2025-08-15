part of 'menu_bloc.dart';

sealed class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object> get props => [];
}

final class MenuInitial extends MenuState {}

final class MenuLoading extends MenuState {}

// State for when the menu is successfully loaded.
final class MenuSuccess extends MenuState {
  final List<MenuItem> menuItems;

  const MenuSuccess(this.menuItems);

  @override
  List<Object> get props => [menuItems];
}

// State for when fetching the menu fails.
final class MenuFailure extends MenuState {
  final String message;

  const MenuFailure(this.message);

  @override
  List<Object> get props => [message];
}