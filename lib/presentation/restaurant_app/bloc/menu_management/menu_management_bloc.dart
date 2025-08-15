import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_zomato/data/models/menu_item_model.dart';
import 'dart:math';

part 'menu_management_event.dart';
part 'menu_management_state.dart';

class MenuManagementBloc extends Bloc<MenuManagementEvent, MenuManagementState> {
  // In a real app, this would be in a repository.
  // We're modifying the static list for demonstration purposes.
  final List<MenuItem> _currentMenu = List.from(MenuItem.mockMenu);

  MenuManagementBloc() : super(MenuManagementInitial()) {
    on<LoadMenu>(_onLoadMenu);
    on<AddMenuItem>(_onAddItem);
    on<DeleteMenuItem>(_onDeleteItem);
  }

  void _onLoadMenu(LoadMenu event, Emitter<MenuManagementState> emit) {
    emit(MenuManagementLoading());
    try {
      // Return the current state of our in-memory menu.
      emit(MenuManagementLoaded(List.from(_currentMenu)));
    } catch (e) {
      emit(MenuManagementError('Failed to load menu: ${e.toString()}'));
    }
  }

  void _onAddItem(AddMenuItem event, Emitter<MenuManagementState> emit) {
    emit(MenuManagementLoading());
    try {
      // Add the new item to our in-memory list.
      _currentMenu.add(event.newItem);
      emit(MenuManagementLoaded(List.from(_currentMenu)));
    } catch (e) {
      emit(MenuManagementError('Failed to add item: ${e.toString()}'));
    }
  }

  void _onDeleteItem(DeleteMenuItem event, Emitter<MenuManagementState> emit) {
    emit(MenuManagementLoading());
    try {
      // Remove the item from our in-memory list.
      _currentMenu.removeWhere((item) => item.id == event.itemId);
      emit(MenuManagementLoaded(List.from(_currentMenu)));
    } catch (e) {
      emit(MenuManagementError('Failed to delete item: ${e.toString()}'));
    }
  }
}