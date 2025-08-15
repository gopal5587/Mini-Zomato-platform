part of 'cart_bloc.dart';

class CartState extends Equatable {
  // A map to hold menu items and their quantities.
  final Map<MenuItem, int> items;

  const CartState({this.items = const {}});

  // Getter to calculate the total price of all items in the cart.
  double get totalPrice {
    if (items.isEmpty) {
      return 0.0;
    }
    double total = 0.0;
    items.forEach((item, quantity) {
      total += item.price * quantity;
    });
    return total;
  }

  // Getter to calculate the total number of individual items.
  int get totalItemCount {
     if (items.isEmpty) {
      return 0;
    }
    return items.values.reduce((sum, quantity) => sum + quantity);
  }

  @override
  List<Object> get props => [items];
}