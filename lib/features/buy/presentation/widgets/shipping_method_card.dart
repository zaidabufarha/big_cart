import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class ShippingMethodCard extends StatelessWidget {
  double price;
  String title;
  String description;

  ShippingMethodCard({
    required this.price,
    required this.title,
    required this.description,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundPrimary,
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 10.w,
        children: [
          Expanded(
            child: Column(
              spacing: 10.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Fonts.titleBold(),
                ),
                Text(
                  description,
                  style: Fonts.paragraphMedium(),
                ),
              ],
            ),
          ),
          Text(
            '\$$price',
            style: Fonts.paragraphRegular().copyWith(
              color: AppColors.primaryDark,
            ),
          ),
        ],
      ),
    );
  }
}
