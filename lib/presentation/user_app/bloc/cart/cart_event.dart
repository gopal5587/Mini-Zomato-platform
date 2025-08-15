part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddItemToCart extends CartEvent {
  final MenuItem item;

  const AddItemToCart(this.item);

  @override
  List<Object> get props => [item];
}

class RemoveItemFromCart extends CartEvent {
  final MenuItem item;

  const RemoveItemFromCart(this.item);

  @override
  List<Object> get props => [item];
}

// New event to clear the cart.
class ClearCart extends CartEvent {}