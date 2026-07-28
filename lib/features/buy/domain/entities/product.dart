import 'package:big_cart/features/buy/domain/entities/category.dart';
import 'package:big_cart/features/buy/domain/entities/review.dart';
import 'package:flutter/material.dart';

class Product {
  String name;
  String imagePath;
  String amount;
  String description;
  double discount;
  double price;
  bool isNew;
  bool isFavorite;
  Category category;
  Color color;
  List<Review> reviewList;
  Product({
    required this.name,
    required this.imagePath,
    required this.amount,
    required this.description,
    required this.discount,
    required this.price,
    required this.isNew,
    required this.isFavorite,
    required this.category,
    required this.color,
    required this.reviewList,
  });
}
