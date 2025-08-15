import 'package:flutter/material.dart';
import 'package:mini_zomato/data/models/order_model.dart';

class NavigationScreen extends StatelessWidget {
  final Order order;

  const NavigationScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Route for #${order.id}'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          // This container will represent the map view.
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://placehold.co/600x800/e0e0e0/757575?text=Map+View'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: Colors.red, size: 50),
                    Text(
                      'Restaurant Location',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 100),
                     Icon(Icons.arrow_downward, color: Colors.blue, size: 40),
                    SizedBox(height: 100),
                    Icon(Icons.home, color: Colors.green, size: 50),
                     Text(
                      'Customer Location',
                       style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Route details panel
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.white,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('DISTANCE', style: TextStyle(color: Colors.grey)),
                    Text('5.2 km', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
                Column(
                  children: [
                    Text('TIME', style: TextStyle(color: Colors.grey)),
                    Text('15 mins', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}