import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_zomato/data/models/menu_item_model.dart';
import 'package:mini_zomato/data/models/restaurant_model.dart';
import 'package:mini_zomato/presentation/user_app/bloc/cart/cart_bloc.dart';
import 'package:mini_zomato/presentation/user_app/bloc/menu/menu_bloc.dart';
import 'package:mini_zomato/presentation/user_app/screens/cart_screen.dart'; 

class RestaurantDetailsScreen extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantDetailsScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
        backgroundColor: Colors.red,
      ),
      body: BlocProvider(
        create: (context) => MenuBloc()..add(FetchMenu(restaurantId: restaurant.id)),
       
        child: Stack(
          children: [
            BlocBuilder<MenuBloc, MenuState>(
              builder: (context, state) {
                if (state is MenuLoading || state is MenuInitial) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is MenuFailure) {
                  return Center(child: Text('Error: ${state.message}'));
                }
                if (state is MenuSuccess) {
                 
                  return ListView.builder(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 80.0),
                    itemCount: state.menuItems.length,
                    itemBuilder: (context, index) {
                      final menuItem = state.menuItems[index];
                      return MenuItemCard(menuItem: menuItem);
                    },
                  );
                }
                return const Center(child: Text('Something went wrong!'));
              },
            ),
            
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ViewCartBanner(),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItemCard extends StatelessWidget {
  final MenuItem menuItem;

  const MenuItemCard({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.circle,
                    color: menuItem.isVeg ? Colors.green : Colors.red,
                    size: 16,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    menuItem.name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '₹${menuItem.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    menuItem.description,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16.0),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    menuItem.imageUrl,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 80,
                        width: 80,
                        color: Colors.grey[200],
                        child: const Icon(Icons.restaurant_menu, color: Colors.grey),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    
                    context.read<CartBloc>().add(AddItemToCart(menuItem));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${menuItem.name} added to cart!'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('ADD', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class ViewCartBanner extends StatelessWidget {
  const ViewCartBanner({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state.items.isEmpty) {
         
          return const SizedBox.shrink();
        }
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(12.0),
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: Colors.green[700],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${state.totalItemCount} ITEM${state.totalItemCount > 1 ? 'S' : ''}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '₹${state.totalPrice.toStringAsFixed(2)} plus taxes',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      'View Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Icon(Icons.shopping_cart_outlined, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}