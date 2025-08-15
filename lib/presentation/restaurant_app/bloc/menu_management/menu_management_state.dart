part of 'menu_management_bloc.dart';

sealed class MenuManagementState extends Equatable {
  const MenuManagementState();

  @override
  List<Object> get props => [];
}

final class MenuManagementInitial extends MenuManagementState {}

final class MenuManagementLoading extends MenuManagementState {}

// State when the menu is successfully loaded
final class MenuManagementLoaded extends MenuManagementState {
  final List<MenuItem> menuItems;

  const MenuManagementLoaded(this.menuItems);

  @override
  List<Object> get props => [menuItems];
}

final class MenuManagementError extends MenuManagementState {
  final String message;

  const MenuManagementError(this.message);

  @override
  List<Object> get props => [message];
}