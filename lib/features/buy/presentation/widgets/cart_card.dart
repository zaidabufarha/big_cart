import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/features/buy/domain/entities/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartCard extends StatelessWidget {
  CartItem data;
  CartCard(this.data, {super.key});
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(data.product.name),
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: ScrollMotion(),
        children: [
          CustomSlidableAction(
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            child: Icon(
              Icons.delete,
              size: 30.r,
            ),
            onPressed: (BuildContext context) {},
          ),
        ],
      ),
      child: Container(
        color: AppColors.backgroundPrimary,
        padding: EdgeInsets.all(5),
        child: Row(
          spacing: 10.w,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              margin: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: data.product.color,
              ),
              child: Center(
                child: Image.asset(
                  data.product.imagePath,
                  width: 100.w,
                  height: 100.h,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${data.product.price} x ${data.quantity}',
                    style: Fonts.paragraphMedium().copyWith(
                      color: AppColors.primaryDark,
                    ),
                  ),
                  Text(
                    data.product.name,
                    style: Fonts.titleBold(),
                  ),
                  Text(
                    data.product.amount,
                    style: Fonts.paragraphMedium(),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: AppColors.primaryDark,
                  ),
                ),
                Text(
                  data.quantity.toString(),
                  style: Fonts.paragraphRegular(),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove,
                    color: AppColors.primaryDark,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
