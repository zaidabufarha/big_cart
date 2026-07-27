import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/core/widgets/green_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

//seperate page because theres almost nothing in common with the normal page and i can just check the cart being

class EmptyShoppingCartPage extends StatelessWidget {
  final formKey = GlobalKey();
  EmptyShoppingCartPage({super.key});
  @override
  Widget build(BuildContext context) {
    void onClick(int? index) {}
    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundPrimary,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),

        centerTitle: true,
        title: Text(
          'Shopping Cart',
          style: Fonts.titleBold(size: 20),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(80),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: AppColors.primaryDark,
                      size: 200.r,
                    ),
                    Text(
                      'Your cart is empty!',
                      textAlign: TextAlign.center,
                      style: Fonts.titleBold(size: 30),
                    ),
                    Text(
                      'Add items to your cart to see them here.',
                      textAlign: TextAlign.center,
                      style: Fonts.paragraphRegular(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GreenGradientButton(onClick, 'Start shopping'),
          ),
        ],
      ),
    );
  }
}
