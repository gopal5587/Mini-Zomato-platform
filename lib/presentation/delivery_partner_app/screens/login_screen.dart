import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_zomato/presentation/delivery_partner_app/bloc/auth/delivery_auth_bloc.dart';
import 'package:mini_zomato/presentation/delivery_partner_app/screens/assigned_orders_screen.dart'; // We will create this next

class DeliveryPartnerLoginScreen extends StatelessWidget {
  const DeliveryPartnerLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeliveryAuthBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Delivery Partner'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: BlocConsumer<DeliveryAuthBloc, DeliveryAuthState>(
          listener: (context, state) {
            if (state is DeliveryAuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.redAccent,
                ),
              );
            } else if (state is DeliveryAuthSuccess) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const AssignedOrdersScreen(),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is DeliveryAuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return const DeliveryLoginForm();
          },
        ),
      ),
    );
  }
}

class DeliveryLoginForm extends StatefulWidget {
  const DeliveryLoginForm({super.key});

  @override
  State<DeliveryLoginForm> createState() => _DeliveryLoginFormState();
}

class _DeliveryLoginFormState extends State<DeliveryLoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    context.read<DeliveryAuthBloc>().add(
          DeliveryLoginRequested(
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
              Icons.delivery_dining,
              size: 80,
              color: Colors.blueGrey,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Partner Login',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48.0),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'partner@test.com',
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
                backgroundColor: Colors.blueGrey,
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