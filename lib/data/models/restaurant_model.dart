import 'package:equatable/equatable.dart';

// The Restaurant model class. Using Equatable to allow for easy value comparison.
class Restaurant extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String cuisine;
  final double rating;
  final String distance; // e.g., "2.5 km"

  const Restaurant({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.cuisine,
    required this.rating,
    required this.distance,
  });

  // The props getter is used by Equatable to determine if two instances are equal.
  @override
  List<Object?> get props => [id, name, imageUrl, cuisine, rating, distance];

  // A factory constructor for creating a new Restaurant instance from a map.
  // This is useful when we fetch data from an API (e.g., JSON).
  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      cuisine: map['cuisine'] ?? '',
      rating: (map['rating'] ?? 0.0).toDouble(),
      distance: map['distance'] ?? '',
    );
  }

  // A method for converting a Restaurant instance to a map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'cuisine': cuisine,
      'rating': rating,
      'distance': distance,
    };
  }

  // Mock data for development and testing purposes.
  // This allows us to build the UI without a real backend.
  static final List<Restaurant> mockRestaurants = [
    const Restaurant(
      id: '1',
      name: 'The Golden Spoon',
      imageUrl: 'https://placehold.co/600x400/FFC107/FFFFFF?text=Golden+Spoon',
      cuisine: 'North Indian, Mughlai',
      rating: 4.5,
      distance: '1.2 km',
    ),
    const Restaurant(
      id: '2',
      name: 'Pasta Paradise',
      imageUrl: 'https://placehold.co/600x400/E91E63/FFFFFF?text=Pasta+Paradise',
      cuisine: 'Italian, Continental',
      rating: 4.2,
      distance: '2.5 km',
    ),
    const Restaurant(
      id: '3',
      name: 'Dragon Wok',
      imageUrl: 'https://placehold.co/600x400/4CAF50/FFFFFF?text=Dragon+Wok',
      cuisine: 'Chinese, Asian',
      rating: 4.7,
      distance: '3.1 km',
    ),
     const Restaurant(
      id: '4',
      name: 'Burger Barn',
      imageUrl: 'https://placehold.co/600x400/FF5722/FFFFFF?text=Burger+Barn',
      cuisine: 'Fast Food, American',
      rating: 4.0,
      distance: '4.0 km',
    ),
  ];
}