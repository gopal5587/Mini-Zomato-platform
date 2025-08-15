import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_zomato/presentation/user_app/bloc/auth/auth_bloc.dart';
import 'package:mini_zomato/presentation/user_app/bloc/cart/cart_bloc.dart';
import 'package:mini_zomato/presentation/user_app/bloc/order/order_bloc.dart'; // Import OrderBloc
import 'package:mini_zomato/presentation/user_app/screens/home_screen.dart';
import 'package:mini_zomato/presentation/user_app/screens/login_screen.dart';
import 'package:mini_zomato/presentation/restaurant_app/screens/login_screen.dart';
import 'package:mini_zomato/presentation/delivery_partner_app/screens/login_screen.dart';

// BLoC Observer for Debugging
class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Use MultiBlocProvider to provide multiple BLoCs to the widget tree.
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => OrderBloc()), // Add OrderBloc here
      ],
      child: MaterialApp(
        title: 'Mini Zomato',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Inter',
        ),
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              return const HomeScreen();
            }
            return const UserLoginScreen();
          },
        ),

        //RestaurantLoginScreen()
        //DeliveryPartnerLoginScreen()
      ),
    );
  }
}