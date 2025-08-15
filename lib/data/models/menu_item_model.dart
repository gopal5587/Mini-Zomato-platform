import 'package:equatable/equatable.dart';

enum ItemCategory {
  starter,
  mainCourse,
  dessert,
  beverage,
}

class MenuItem extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final ItemCategory category;
  final bool isVeg;

  const MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.isVeg,
  });

  @override
  List<Object?> get props => [id, name, description, price, imageUrl, category, isVeg];

  // Mock data for a restaurant's menu.
  // In a real app, you'd fetch this based on a restaurant ID.
  static final List<MenuItem> mockMenu = [
    const MenuItem(
      id: 'm1',
      name: 'Paneer Tikka',
      description: 'Marinated cottage cheese cubes grilled to perfection.',
      price: 250.00,
      imageUrl: 'https://placehold.co/600x400/FF9800/FFFFFF?text=Paneer+Tikka',
      category: ItemCategory.starter,
      isVeg: true,
    ),
    const MenuItem(
      id: 'm2',
      name: 'Butter Chicken',
      description: 'Classic creamy and tangy chicken curry.',
      price: 350.00,
      imageUrl: 'https://placehold.co/600x400/F44336/FFFFFF?text=Butter+Chicken',
      category: ItemCategory.mainCourse,
      isVeg: false,
    ),
    const MenuItem(
      id: 'm3',
      name: 'Dal Makhani',
      description: 'Creamy lentils simmered overnight with spices.',
      price: 220.00,
      imageUrl: 'https://placehold.co/600x400/795548/FFFFFF?text=Dal+Makhani',
      category: ItemCategory.mainCourse,
      isVeg: true,
    ),
    const MenuItem(
      id: 'm4',
      name: 'Chocolate Lava Cake',
      description: 'Warm chocolate cake with a gooey molten center.',
      price: 180.00,
      imageUrl: 'https://placehold.co/600x400/607D8B/FFFFFF?text=Lava+Cake',
      category: ItemCategory.dessert,
      isVeg: true,
    ),
     const MenuItem(
      id: 'm5',
      name: 'Masala Lemonade',
      description: 'A refreshing and tangy spiced lemonade.',
      price: 90.00,
      imageUrl: 'https://placehold.co/600x400/CDDC39/FFFFFF?text=Lemonade',
      category: ItemCategory.beverage,
      isVeg: true,
    ),
  ];
}