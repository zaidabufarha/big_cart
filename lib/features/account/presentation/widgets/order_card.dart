import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/features/account/domain/entities/address.dart';
import 'package:big_cart/features/account/domain/entities/order.dart';
import 'package:big_cart/features/account/presentation/pages/track_order_page.dart';
import 'package:big_cart/features/account/presentation/widgets/order_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:intl/intl.dart';

class OrderCard extends StatelessWidget {
  final formKey = GlobalKey();
  bool isClosed;
  Order order;
  bool hasButton = true;
  OrderCard.closed(this.order, {super.key}) : isClosed = true;
  OrderCard.open(this.order, {super.key}) : isClosed = false;
  OrderCard.noButton(this.order, {super.key})
    : isClosed = true,
      hasButton = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => TrackOrderPage(order)));
      },
      child: Container(
        width: double.infinity,
        color: AppColors.backgroundPrimary,
        child: Column(
          spacing: 7.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Row(
              spacing: 10.w,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  width: 80.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.inventory_2_outlined,
                    size: 40.r,
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: 3.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order #${order.id.toString()}',
                        style: Fonts.titleBold(),
                      ),
                      Text(
                        'Placed on ${DateFormat('MMM d, y').format(order.datePlaced)}',
                        style: Fonts.paragraphRegular(size: 12),
                      ),
                      Row(
                        spacing: 10.w,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'Items: ',
                              style: Fonts.label().copyWith(
                                color: AppColors.textPrimary,
                              ),
                              children: [
                                TextSpan(
                                  text: order.productList.length.toString(),
                                  style: Fonts.label().copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text: 'Total: ',
                              style: Fonts.label().copyWith(
                                color: AppColors.textPrimary,
                              ),
                              children: [
                                TextSpan(
                                  text: '\$67.67',
                                  style: Fonts.label().copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                (hasButton)
                    ? Transform.rotate(
                        //there is no identical up arrow so I'll just make my own
                        angle: (!isClosed) ? 3.14159 : 0,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_drop_down_circle_outlined,
                            color: AppColors.primaryDark,
                            size: 30.r,
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            ),

            (!isClosed || order.dateDelivered != null)
                ? Divider(
                    thickness: 1.h,
                  )
                : SizedBox(),
            (!isClosed)
                ? Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,

                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,

                              spacing: 20.w,
                              children: [
                                OrderProgressIndicator(
                                  isActive: true, //placed cannot be null
                                  isFirst: true,
                                ),
                                Text(
                                  'Order placed',
                                  style: Fonts.titleBold(),
                                ),
                              ],
                            ),
                            Text(
                              DateFormat('MMM d, y').format(order.datePlaced),
                              style: Fonts.paragraphRegular(),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,

                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              spacing: 20.w,
                              children: [
                                OrderProgressIndicator(
                                  isActive: (order.dateConfirmed != null),
                                  isFirst: false,
                                ),
                                Text(
                                  'Order confirmed',
                                  style: Fonts.titleBold(),
                                ),
                              ],
                            ),
                            Text(
                              (order.dateConfirmed != null)
                                  ? DateFormat(
                                      'MMM d, y',
                                    ).format(order.dateConfirmed!)
                                  : 'pending',
                              style: Fonts.paragraphRegular(),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,

                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              spacing: 20.w,
                              children: [
                                OrderProgressIndicator(
                                  isActive: (order.dateShipped != null),
                                  isFirst: false,
                                ),
                                Text(
                                  'Order shipped',
                                  style: Fonts.titleBold(),
                                ),
                              ],
                            ),
                            Text(
                              (order.dateShipped != null)
                                  ? DateFormat(
                                      'MMM d, y',
                                    ).format(order.dateShipped!)
                                  : 'pending',
                              style: Fonts.paragraphRegular(),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,

                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              spacing: 20.w,
                              children: [
                                OrderProgressIndicator(
                                  isActive: (order.dateOutForDelivery != null),
                                  isFirst: false,
                                ),
                                Text(
                                  'Out for delivery',
                                  style: Fonts.titleBold(),
                                ),
                              ],
                            ),
                            Text(
                              (order.dateOutForDelivery != null)
                                  ? DateFormat(
                                      'MMM d, y',
                                    ).format(order.dateOutForDelivery!)
                                  : 'pending',
                              style: Fonts.paragraphRegular(),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,

                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              spacing: 20.w,
                              children: [
                                OrderProgressIndicator(
                                  isActive: (order.dateDelivered != null),
                                  isFirst: false,
                                ),
                                Text(
                                  'Order delivered',
                                  style: Fonts.titleBold(),
                                ),
                              ],
                            ),
                            Text(
                              (order.dateDelivered != null)
                                  ? DateFormat(
                                      'MMM d, y',
                                    ).format(order.dateDelivered!)
                                  : 'pending',
                              style: Fonts.paragraphRegular(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : (isClosed && order.dateDelivered != null)
                ? Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,

                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          spacing: 20.w,
                          children: [
                            OrderProgressIndicator(
                              isActive: false,
                              isFirst: true,
                            ),
                            Text(
                              'Order delivered',
                              style: Fonts.titleBold(),
                            ),
                          ],
                        ),
                        Text(
                          (order.dateDelivered != null)
                              ? DateFormat(
                                  'MMM d, y',
                                ).format(order.dateDelivered!)
                              : 'pending',
                          style: Fonts.paragraphRegular(),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
