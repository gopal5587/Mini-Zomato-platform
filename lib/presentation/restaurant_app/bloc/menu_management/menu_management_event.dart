part of 'menu_management_bloc.dart';

sealed class MenuManagementEvent extends Equatable {
  const MenuManagementEvent();

  @override
  List<Object> get props => [];
}

// Event to load the restaurant's current menu
class LoadMenu extends MenuManagementEvent {}

// Event to add a new item to the menu
class AddMenuItem extends MenuManagementEvent {
  final MenuItem newItem;

  const AddMenuItem(this.newItem);

  @override
  List<Object> get props => [newItem];
}

// Event to delete an item from the menu
class DeleteMenuItem extends MenuManagementEvent {
  final String itemId;

  const DeleteMenuItem(this.itemId);

  @override
  List<Object> get props => [itemId];
}