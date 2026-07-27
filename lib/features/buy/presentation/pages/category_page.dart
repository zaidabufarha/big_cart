import 'package:big_cart/core/colors.dart';
import 'package:big_cart/features/buy/domain/entities/product.dart';
import 'package:big_cart/features/buy/presentation/widgets/product_list.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  List<Product> categoryProductsList;
  CategoryPage(this.categoryProductsList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.tune,
              color: Colors.black,
            ),
          ),
        ],
        centerTitle: true,
        title: Text('Vegetables'),
        backgroundColor: AppColors.backgroundPrimary,
      ),
      backgroundColor: AppColors.backgroundSecondary,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: ProductList(categoryProductsList),
        ),
      ),
    );
  }
}
