import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_zomato/data/models/menu_item_model.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuInitial()) {
    on<FetchMenu>(_onFetchMenu);
  }

  Future<void> _onFetchMenu(
    FetchMenu event,
    Emitter<MenuState> emit,
  ) async {
    emit(MenuLoading());
    try {
      // Simulate a network call. In a real app, you would use event.restaurantId
      // to fetch the specific menu from your backend.
      await Future.delayed(const Duration(seconds: 1));

      // For now, we'll just return the same mock menu regardless of the ID.
      final menu = MenuItem.mockMenu;

      emit(MenuSuccess(menu));
    } catch (e) {
      emit(MenuFailure('Failed to fetch menu: ${e.toString()}'));
    }
  }
}