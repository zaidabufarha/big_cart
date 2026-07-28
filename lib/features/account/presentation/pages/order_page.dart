import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/core/widgets/green_gradient_button.dart';
import 'package:big_cart/features/account/domain/entities/order.dart';
import 'package:big_cart/features/account/presentation/widgets/address_card.dart';
import 'package:big_cart/features/account/presentation/widgets/order_card.dart';
import 'package:big_cart/features/buy/domain/entities/category.dart';
import 'package:big_cart/features/buy/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class OrderPage extends StatelessWidget {
  List<Order> orderList;
  OrderPage(this.orderList, {super.key});
  @override
  Widget build(BuildContext context) {
    // orderList.add(
    //   Order(
    //     id: 23,
    //     productList: [
    //       Product(
    //         name: 'broccoli',
    //         imagePath: 'assets/broccoli.png',
    //         amount: '3kg',
    //         description: 'nice',
    //         discount: 43,
    //         price: 67,
    //         isNew: false,
    //         isFavorite: false,
    //         category: categoryList[0],
    //         color: Colors.green,
    //         reviewList: [],
    //       ),
    //     ],
    //     datePlaced: DateTime.now(),
    //     dateConfirmed: DateTime.now(),
    //   ),
    // );
    // orderList.add(
    //   Order(
    //     id: 54,
    //     productList: [
    //       Product(
    //         name: 'broccoli',
    //         imagePath: 'assets/broccoli.png',
    //         amount: '3kg',
    //         description: 'nice',
    //         discount: 43,
    //         price: 67,
    //         isNew: false,
    //         isFavorite: false,
    //         category: categoryList[0],
    //         color: Colors.green,
    //         reviewList: [],
    //       ),
    //     ],
    //     datePlaced: DateTime.now(),
    //     dateConfirmed: DateTime.now(),
    //     dateShipped: DateTime.now(),
    //     dateOutForDelivery: DateTime.now(),
    //     dateDelivered: DateTime.now(),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundPrimary,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.tune_outlined)),
        ],
        centerTitle: true,
        title: Text(
          'My Orders',
          style: Fonts.titleBold(size: 20),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10.h,
            children: [
              OrderCard.open(orderList[0]), OrderCard.closed(orderList[1]),

              //OrderCard.closed(orderList[1]),
            ],
          ),
        ),
      ),
    );
  }
}
