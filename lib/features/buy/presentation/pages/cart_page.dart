import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/core/widgets/green_gradient_button.dart';
import 'package:big_cart/features/buy/domain/entities/product.dart';
import 'package:big_cart/features/buy/presentation/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class CartPage extends StatelessWidget {
  List<Map<Product, int>> items;
  bool favorites = false;
  double subtotal = 0;
  double shipping = 1.5;
  CartPage(this.items, {super.key});
  CartPage.favorites(this.items, {super.key}) : favorites = true;
  @override
  Widget build(BuildContext context) {
    items.add({productList[1]: 8});
    items.add({productList[0]: 2});
    items.add({productList[4]: 13});
    items.add({productList[3]: 6});
    items.add({productList[2]: 1});
    items.add({productList[5]: 3});

    void onClick(int? index) {}
    double sumOfPrices(List<Map<Product, int>> items) {
      double sum = 0;
      for (Map<Product, int> item in items) {
        sum += item.keys.first.price * (100 - item.keys.first.discount) / 100;
      }
      return sum;
    }

    subtotal = sumOfPrices(items);

    return Scaffold(
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
          (favorites) ? 'Favorites' : 'Shopping Cart',
          style: Fonts.titleBold(size: 20),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.all(20),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10.h,
                  children: [
                    for (Map<Product, int> item in items) CartCard(item),
                  ],
                ),
              ),
            ),
          ),
          (favorites)
              ? SizedBox()
              : Container(
                  padding: const EdgeInsets.all(20),
                  color: AppColors.backgroundPrimary,
                  child: Column(
                    spacing: 10.h,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: Fonts.paragraphMedium(),
                          ),
                          Text(
                            '\$$subtotal',
                            style: Fonts.paragraphMedium(),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping charges',
                            style: Fonts.paragraphMedium(),
                          ),
                          Text(
                            '\$$shipping',
                            style: Fonts.paragraphMedium(),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: Fonts.titleBold(size: 18),
                          ),
                          Text(
                            '\$${subtotal + shipping}',
                            style: Fonts.titleBold(size: 18),
                          ),
                        ],
                      ),
                      SizedBox(),
                      GreenGradientButton(onClick, 'Checkout'),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
