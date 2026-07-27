import 'package:big_cart/core/converter/color_converter.dart';
import 'package:big_cart/features/buy/domain/entities/category.dart';
import 'package:big_cart/features/buy/domain/entities/review.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class Product {
  String name;
  String imagePath;
  String amount;
  String description;
  double price;
  int discount;
  bool isNew;
  bool isFavorite;
  Category category;
  @ColorConverter()
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

List<Product> productList = [
  Product(
    name: 'Fresh Peach',
    imagePath: 'assets/peach.png',
    amount: 'dozen',
    description: 'Sweet and juicy fresh peaches.',
    price: 8.00,
    discount: 0,
    isNew: false,
    isFavorite: false,
    category: categoryList[0],
    color: const Color(0xFFFFCEC1),
    reviewList: [],
  ),
  Product(
    name: 'Avacodo',
    imagePath: 'assets/avocado.png',
    amount: '2.0 lbs',
    description: 'Fresh and creamy organic avocados.',
    price: 7.00,
    discount: 0,
    isNew: true,
    isFavorite: false,
    category: categoryList[0],
    color: const Color(0xFFFCFFD9),
    reviewList: [],
  ),
  Product(
    name: 'Pineapple',
    imagePath: 'assets/pineapple.png',
    amount: '1.50 lbs',
    description: 'Sweet, tropical gold pineapples.',
    price: 9.90,
    discount: 0,
    isNew: false,
    isFavorite: true,
    category: categoryList[0],
    color: const Color(0xFFFFE6C2),
    reviewList: [],
  ),
  Product(
    name: 'Black Grapes',
    imagePath: 'assets/grapes.png',
    amount: '5.0 lbs',
    description: 'Fresh, sweet seedless black grapes.',
    price: 7.05,
    discount: 16,
    isNew: false,
    isFavorite: false,
    category: categoryList[0],
    color: const Color(0xFFFEE1ED),
    reviewList: [],
  ),
  Product(
    name: 'Pomegranate',
    imagePath: 'assets/pomegranate.png',
    amount: '1.50 lbs',
    description: 'Delicious and antioxidant-rich fresh pomegranates.',
    price: 2.09,
    discount: 0,
    isNew: true,
    isFavorite: false,
    category: categoryList[0],
    color: const Color(0xFFFFE3E2),
    reviewList: [],
  ),
  Product(
    name: 'Fresh Broccoli',
    imagePath: 'assets/broccoli.png',
    amount: '1 kg',
    description: 'Nutritious and fresh organic broccoli heads.',
    price: 3.00,
    discount: 0,
    isNew: false,
    isFavorite: true,
    category: categoryList[0],
    color: const Color(0xFFD2FFD0),
    reviewList: [],
  ),
];
