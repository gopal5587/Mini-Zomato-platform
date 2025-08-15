import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_zomato/data/models/order_model.dart';
import 'package:mini_zomato/presentation/delivery_partner_app/bloc/delivery_orders/delivery_orders_bloc.dart';
import 'package:mini_zomato/presentation/delivery_partner_app/bloc/delivery_status/delivery_status_bloc.dart';
import 'package:mini_zomato/presentation/delivery_partner_app/screens/navigation_screen.dart'; // Import the navigation screen

class AssignedOrdersScreen extends StatelessWidget {
  const AssignedOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assigned Deliveries'),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              // TODO: Implement logout
              print('Delivery partner logout pressed');
            },
          ),
        ],
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DeliveryOrdersBloc()..add(FetchAssignedOrders()),
          ),
          BlocProvider(
            create: (context) => DeliveryStatusBloc(),
          ),
        ],
        child: BlocListener<DeliveryStatusBloc, DeliveryStatusState>(
          listener: (context, state) {
            if (state is DeliveryStatusUpdateSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Order status updated successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
              context.read<DeliveryOrdersBloc>().add(FetchAssignedOrders());
            } else if (state is DeliveryStatusUpdateFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.redAccent,
                ),
              );
            }
          },
          child: BlocBuilder<DeliveryOrdersBloc, DeliveryOrdersState>(
            builder: (context, state) {
              if (state is DeliveryOrdersLoading || state is DeliveryOrdersInitial) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is DeliveryOrdersFailure) {
                return Center(child: Text('Error: ${state.message}'));
              }
              if (state is DeliveryOrdersSuccess) {
                if (state.orders.isEmpty) {
                  return const Center(
                    child: Text(
                      'No deliveries assigned.',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: state.orders.length,
                  itemBuilder: (context, index) {
                    return DeliveryTaskCard(order: state.orders[index]);
                  },
                );
              }
              return const Center(child: Text('Something went wrong.'));
            },
          ),
        ),
      ),
    );
  }
}

class DeliveryTaskCard extends StatelessWidget {
  final Order order;

  const DeliveryTaskCard({super.key, required this.order});

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
            Text(
              'Order #${order.id}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Divider(height: 20),
            const Text(
              'PICKUP FROM:',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            Text(
              order.restaurantName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            const Text(
              'DELIVER TO:',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            const Text(
              '123, Flutter Lane, Tech City', // Mock address
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            // A row for the two main action buttons
            Row(
              children: [
                // Navigate Button
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => NavigationScreen(order: order),
                        ),
                      );
                    },
                    icon: const Icon(Icons.navigation_outlined),
                    label: const Text('Navigate'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blueGrey,
                      side: const BorderSide(color: Colors.blueGrey),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                // Mark as Delivered Button
                Expanded(
                  child: BlocBuilder<DeliveryStatusBloc, DeliveryStatusState>(
                    builder: (context, state) {
                      final bool inProgress = state is DeliveryStatusUpdateInProgress;
                      return ElevatedButton.icon(
                        onPressed: inProgress
                            ? null
                            : () {
                                context.read<DeliveryStatusBloc>().add(
                                      UpdateDeliveryStatus(
                                        orderId: order.id,
                                        newStatus: OrderStatus.delivered,
                                      ),
                                    );
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        icon: inProgress
                            ? Container(
                                width: 18,
                                height: 18,
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.check, color: Colors.white),
                        label: Text(
                          inProgress ? '...' : 'Delivered',
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}