import 'package:big_cart/core/converter/color_converter.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class Category {
  String name;
  String imagePath;
  @ColorConverter()
  Color color;
  Category({required this.name, required this.imagePath, required this.color});
}

List<Category> categoryList = [
  Category(
    name: 'Vegetables',
    imagePath: 'assets/lettuce.png',
    color: Color(0xFFE6F2EA),
  ),
  Category(
    name: 'Fruits',
    imagePath: 'assets/apple.png',
    color: Color(0xFFFFE9E5),
  ),
  Category(
    name: 'Beverages',
    imagePath: 'assets/apple-cider.png',
    color: Color(0xFFFFF6E3),
  ),
  Category(
    name: 'Grocery',
    imagePath: 'assets/vegetable.png',
    color: Color(0xFFFFF6E3),
  ),
  Category(
    name: 'Beverages',
    imagePath: 'assets/apple-cider.png',
    color: Color(0xFFF3EFFA),
  ),
  Category(
    name: 'Edible oil',
    imagePath: 'assets/olive-oil.png',
    color: Color(0xFFDCF4F5),
  ),
  Category(
    name: 'Household',
    imagePath: 'assets/vacuum-cleaner.png',
    color: Color(0xFFFFE8F2),
  ),
  Category(
    name: 'Babycare',
    imagePath: 'assets/baby-bottle.png',
    color: Color(0xFFD2EFFF),
  ),
];
