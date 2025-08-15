import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_zomato/data/models/order_model.dart';
import 'package:mini_zomato/presentation/restaurant_app/bloc/incoming_orders/incoming_orders_bloc.dart';
import 'package:mini_zomato/presentation/restaurant_app/bloc/order_action/order_action_bloc.dart';
import 'package:mini_zomato/presentation/restaurant_app/screens/menu_management_screen.dart'; // Import the new screen

class RestaurantDashboardScreen extends StatelessWidget {
  const RestaurantDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Incoming Orders'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              // TODO: Implement logout for restaurant
              print('Restaurant logout pressed');
            },
          ),
        ],
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => IncomingOrdersBloc()..add(FetchIncomingOrders()),
          ),
          BlocProvider(
            create: (context) => OrderActionBloc(),
          ),
        ],
        child: BlocListener<OrderActionBloc, OrderActionState>(
          listener: (context, state) {
            if (state is OrderActionSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${state.message} (#${state.orderId})'),
                  backgroundColor: Colors.green,
                ),
              );
              context.read<IncomingOrdersBloc>().add(FetchIncomingOrders());
            } else if (state is OrderActionFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.redAccent,
                ),
              );
            }
          },
          child: BlocBuilder<IncomingOrdersBloc, IncomingOrdersState>(
            builder: (context, state) {
              if (state is IncomingOrdersLoading || state is IncomingOrdersInitial) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is IncomingOrdersFailure) {
                return Center(child: Text('Error: ${state.message}'));
              }
              if (state is IncomingOrdersSuccess) {
                if (state.orders.isEmpty) {
                  return const Center(
                    child: Text(
                      'No new orders right now.',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: state.orders.length,
                  itemBuilder: (context, index) {
                    return IncomingOrderCard(order: state.orders[index]);
                  },
                );
              }
              return const Center(child: Text('Something went wrong.'));
            },
          ),
        ),
      ),
      // Add a FloatingActionButton to navigate to the menu management screen
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const MenuManagementScreen()),
          );
        },
        backgroundColor: Colors.teal,
        icon: const Icon(Icons.restaurant_menu, color: Colors.white),
        label: const Text('Manage Menu', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

// IncomingOrderCard widget remains the same
class IncomingOrderCard extends StatelessWidget {
  final Order order;
  const IncomingOrderCard({super.key, required this.order});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order #${order.id}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text('₹${order.totalPrice.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.teal)),
              ],
            ),
            const Divider(height: 20),
            Text('Items:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700])),
            const SizedBox(height: 8.0),
            ...order.items.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text('• ${item.name}'),
                )),
            const SizedBox(height: 16.0),
            BlocBuilder<OrderActionBloc, OrderActionState>(
              builder: (context, state) {
                final bool inProgress = state is OrderActionInProgress;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: inProgress ? null : () => context.read<OrderActionBloc>().add(RejectOrder(order.id)),
                      style: OutlinedButton.styleFrom(foregroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
                      child: const Text('Reject'),
                    ),
                    const SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: inProgress ? null : () => context.read<OrderActionBloc>().add(AcceptOrder(order.id)),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      child: const Text('Accept', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}