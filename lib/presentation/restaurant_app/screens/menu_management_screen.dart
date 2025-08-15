import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_zomato/data/models/menu_item_model.dart';
import 'package:mini_zomato/presentation/restaurant_app/bloc/menu_management/menu_management_bloc.dart';
import 'dart:math';

class MenuManagementScreen extends StatelessWidget {
  const MenuManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuManagementBloc()..add(LoadMenu()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Manage Menu'),
          backgroundColor: Colors.teal,
        ),
        body: BlocBuilder<MenuManagementBloc, MenuManagementState>(
          builder: (context, state) {
            if (state is MenuManagementLoading || state is MenuManagementInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is MenuManagementError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            if (state is MenuManagementLoaded) {
              return ListView.builder(
                itemCount: state.menuItems.length,
                itemBuilder: (context, index) {
                  final item = state.menuItems[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(item.imageUrl),
                      onBackgroundImageError: (_, __) {}, // Handle image errors gracefully
                    ),
                    title: Text(item.name),
                    subtitle: Text('₹${item.price.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () {
                        context.read<MenuManagementBloc>().add(DeleteMenuItem(item.id));
                      },
                    ),
                  );
                },
              );
            }
            return const Center(child: Text('Something went wrong'));
          },
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () => _showAddItemDialog(context),
            backgroundColor: Colors.teal,
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
    );
  }

  // Shows a dialog to add a new menu item.
  void _showAddItemDialog(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    final priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Add New Item'),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value) => value!.isEmpty ? 'Required' : null,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(labelText: 'Description'),
                    validator: (value) => value!.isEmpty ? 'Required' : null,
                  ),
                  TextFormField(
                    controller: priceController,
                    decoration: const InputDecoration(labelText: 'Price'),
                    keyboardType: TextInputType.number,
                    validator: (value) => value!.isEmpty ? 'Required' : null,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final newItem = MenuItem(
                    id: 'menu-item-${Random().nextInt(1000)}', // Mock ID
                    name: nameController.text,
                    description: descriptionController.text,
                    price: double.tryParse(priceController.text) ?? 0.0,
                    imageUrl: 'https://placehold.co/600x400/9E9E9E/FFFFFF?text=New+Item',
                    category: ItemCategory.mainCourse, // Default category
                    isVeg: true, // Default value
                  );
                  // Use the context from the screen, not the dialog, to find the BLoC.
                  context.read<MenuManagementBloc>().add(AddMenuItem(newItem));
                  Navigator.of(dialogContext).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}