import 'review.dart';

class Restaurant {
  final String name;
  final String cuisine;
  final List<Review> reviews;

  Restaurant({
    required this.name,
    required this.cuisine,
    required this.reviews,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      name: json['name'],
      cuisine: json['cuisine'],
      reviews: (json['reviews'] as List)
          .map((reviewJson) => Review.fromJson(reviewJson))
          .toList(),
    );
  }
}