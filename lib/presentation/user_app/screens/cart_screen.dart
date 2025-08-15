import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_zomato/data/models/menu_item_model.dart';
import 'package:mini_zomato/presentation/user_app/bloc/cart/cart_bloc.dart';
import 'package:mini_zomato/presentation/user_app/bloc/order/order_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: Colors.red,
      ),
      body: BlocConsumer<OrderBloc, OrderState>(
        listener: (context, orderState) {
          if (orderState is OrderPlacementSuccess) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (ctx) => AlertDialog(
                title: const Text('Order Placed!'),
                content: Text('Your order with ID ${orderState.orderId} has been placed successfully.'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      // Dispatch the ClearCart event.
                      context.read<CartBloc>().add(ClearCart());
                      Navigator.of(ctx).pop(); 
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          } else if (orderState is OrderPlacementFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(orderState.message),
                backgroundColor: Colors.redAccent,
              ),
            );
          }
        },
        builder: (context, orderState) {
          return Stack(
            children: [
              BlocBuilder<CartBloc, CartState>(
                builder: (context, cartState) {
                  if (cartState.items.isEmpty && orderState is! OrderPlacementInProgress) {
                    return const Center(
                      child: Text(
                        'Your cart is empty.',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    );
                  }

                  final cartItems = cartState.items.entries.toList();

                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8.0),
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            final menuItem = cartItems[index].key;
                            final quantity = cartItems[index].value;
                            return CartItemCard(
                              menuItem: menuItem,
                              quantity: quantity,
                            );
                          },
                        ),
                      ),
                      // Hide the summary if the cart is empty
                      if (cartItems.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Total Amount', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  Text('₹${cartState.totalPrice.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.read<OrderBloc>().add(
                                          PlaceOrder(
                                            cartItems: cartState.items,
                                            totalPrice: cartState.totalPrice,
                                          ),
                                        );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green[700],
                                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  ),
                                  child: const Text('Place Order', style: TextStyle(fontSize: 18, color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  );
                },
              ),
              if (orderState is OrderPlacementInProgress)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

// CartItemCard widget remains the same.
class CartItemCard extends StatelessWidget {
  final MenuItem menuItem;
  final int quantity;

  const CartItemCard({
    super.key,
    required this.menuItem,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(
              Icons.circle,
              color: menuItem.isVeg ? Colors.green : Colors.red,
              size: 16,
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menuItem.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text('₹${menuItem.price.toStringAsFixed(2)}'),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove, size: 16),
                    onPressed: () {
                      context.read<CartBloc>().add(RemoveItemFromCart(menuItem));
                    },
                    visualDensity: VisualDensity.compact,
                  ),
                  Text(
                    quantity.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, size: 16),
                    onPressed: () {
                      context.read<CartBloc>().add(AddItemToCart(menuItem));
                    },
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}