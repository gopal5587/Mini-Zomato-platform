import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_zomato/presentation/restaurant_app/bloc/auth/restaurant_auth_bloc.dart';
import 'package:mini_zomato/presentation/restaurant_app/screens/dashboard_screen.dart'; // We will create this next

class RestaurantLoginScreen extends StatelessWidget {
  const RestaurantLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // We provide the BLoC to this screen's widget tree.
    // Note: For a real app, you might provide this higher up, like in main.dart.
    return BlocProvider(
      create: (context) => RestaurantAuthBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Restaurant Partner'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: BlocConsumer<RestaurantAuthBloc, RestaurantAuthState>(
          listener: (context, state) {
            if (state is RestaurantAuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.redAccent,
                ),
              );
            } else if (state is RestaurantAuthSuccess) {
              // On success, navigate to the restaurant's dashboard.
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const RestaurantDashboardScreen(),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is RestaurantAuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return const RestaurantLoginForm();
          },
        ),
      ),
    );
  }
}

// Extracted the form into its own widget.
class RestaurantLoginForm extends StatefulWidget {
  const RestaurantLoginForm({super.key});

  @override
  State<RestaurantLoginForm> createState() => _RestaurantLoginFormState();
}

class _RestaurantLoginFormState extends State<RestaurantLoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    context.read<RestaurantAuthBloc>().add(
          RestaurantLoginRequested(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(
              Icons.storefront_outlined,
              size: 80,
              color: Colors.teal,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Restaurant Login',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48.0),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'test@restaurant.com',
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'password',
                prefixIcon: const Icon(Icons.lock_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: _onLoginPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}