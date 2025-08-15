import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_zomato/data/models/menu_item_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddItemToCart>(_onAddItem);
    on<RemoveItemFromCart>(_onRemoveItem);
    on<ClearCart>(_onClearCart); // Register the new event handler
  }

  void _onAddItem(AddItemToCart event, Emitter<CartState> emit) {
    final Map<MenuItem, int> updatedItems = Map.from(state.items);
    updatedItems.update(event.item, (value) => value + 1, ifAbsent: () => 1);
    emit(CartState(items: updatedItems));
  }

  void _onRemoveItem(RemoveItemFromCart event, Emitter<CartState> emit) {
    final Map<MenuItem, int> updatedItems = Map.from(state.items);
    if (updatedItems.containsKey(event.item) && updatedItems[event.item]! > 1) {
      updatedItems[event.item] = updatedItems[event.item]! - 1;
    } else {
      updatedItems.remove(event.item);
    }
    emit(CartState(items: updatedItems));
  }

  // Handler for the ClearCart event.
  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    // Emits a new state with an empty map of items.
    emit(const CartState(items: {}));
  }
}