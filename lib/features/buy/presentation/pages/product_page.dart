import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/features/buy/domain/entities/product.dart';
import 'package:big_cart/features/buy/presentation/widgets/grey_vertical_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar_plus/flutter_rating_bar_plus.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class ProductPage extends StatelessWidget {
  Product product;
  ProductPage(this.product, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: WidgetStateColor.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: product.color,
      body: Stack(
        children: [
          SizedBox.expand(
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 370.h,
                  top: 0,
                  child: Image.asset(
                    product.imagePath,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  height: 420.h,
                  bottom: 0.h,
                  child: Container(
                    padding: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundSecondary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10.h,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${product.price.toStringAsFixed(2)}',
                              style: Fonts.titleBold(size: 25).copyWith(
                                color: AppColors.primaryDark,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_border,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          product.name,
                          style: Fonts.titleBold(
                            size: 30,
                          ).copyWith(color: AppColors.textPrimary),
                        ),
                        Text(product.amount, style: Fonts.paragraphRegular()),
                        Row(
                          spacing: 5.w,
                          children: [
                            Text(
                              '2.9',
                              style: Fonts.paragraphRegular().copyWith(
                                color: Colors.black,
                              ),
                            ),
                            RatingBarIndicator(
                              rating: 2.9, // from backend
                              itemCount: 5,
                              itemSize: 30.w,
                              itemBuilder: ((context, index) => Icon(
                                Icons.star,
                                color: Color(0xFFFFC107),
                              )),
                            ),
                            Text(
                              '(67 reviews)', //from backend
                              style: Fonts.paragraphRegular(),
                            ),
                          ],
                        ),
                        Text(
                          product.description,
                          maxLines: 5,
                          style: Fonts.paragraphRegular(),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.r),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            spacing: 10.w,
                            children: [
                              Text(
                                'Quantity',
                                style: Fonts.titleBold(size: 20),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 20.w,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.remove,
                                      color: AppColors.primaryDark,
                                    ),
                                  ),
                                  GreyVerticalDivider(),
                                  Text(
                                    '67',
                                    style: Fonts.titleBold(size: 20),
                                  ),
                                  GreyVerticalDivider(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.add,
                                      color: AppColors.primaryDark,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        //making this work with the green button would need refactoring so for now ill just reuse some code
                        Container(
                          height: 70.h,
                          padding: EdgeInsets.all(10.r),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.primary,
                                AppColors.primaryDark,
                              ],
                              begin: AlignmentGeometry.bottomLeft,
                              end: AlignmentGeometry.topRight,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(),
                              Text(
                                'Add to cart',
                                style: Fonts.titleBold(size: 20).copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
