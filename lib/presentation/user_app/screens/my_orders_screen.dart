import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_zomato/data/models/order_model.dart';
import 'package:mini_zomato/presentation/user_app/bloc/order_history/order_history_bloc.dart';
import 'package:intl/intl.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderHistoryBloc()..add(FetchOrderHistory()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Orders'),
          backgroundColor: Colors.red,
        ),
        body: BlocBuilder<OrderHistoryBloc, OrderHistoryState>(
          builder: (context, state) {
            if (state is OrderHistoryLoading || state is OrderHistoryInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is OrderHistoryFailure) {
              return Center(child: Text('Error: ${state.message}'));
            }
            if (state is OrderHistorySuccess) {
              if (state.orders.isEmpty) {
                return const Center(child: Text('You have no past orders.'));
              }
              return ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: state.orders.length,
                itemBuilder: (context, index) {
                  return OrderHistoryCard(order: state.orders[index]);
                },
              );
            }
            return const Center(child: Text('Something went wrong.'));
          },
        ),
      ),
    );
  }
}

class OrderHistoryCard extends StatelessWidget {
  final Order order;

  const OrderHistoryCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order.restaurantName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  '#${order.id}',
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            const Divider(),
            Text(
              'Items: ${order.items.map((item) => item.name).join(', ')}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat.yMMMd().add_jm().format(order.orderDate), 
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Text(
                  '₹${order.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}