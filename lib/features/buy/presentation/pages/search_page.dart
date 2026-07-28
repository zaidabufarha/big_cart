import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/features/buy/domain/entities/category.dart';
import 'package:big_cart/features/buy/domain/entities/product.dart';
import 'package:big_cart/features/buy/presentation/widgets/category_icon.dart';
import 'package:big_cart/features/buy/presentation/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> history = [
      'Fresh Grocery',
      'Bananas',
      'cheetos',
      'vegetablels',
      'Fruits',
      'discounted items',
      'Fresh vegetables',
    ];
    List<String> discoverOptions = [
      'Fresh Grocery',
      'Bananas',
      'cheetos',
      'vegetablels',
      'Fruits',
      'discounted items',
      'Fresh vegetables',
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20.h,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: AppColors.backgroundPrimary, //white
      body: Column(
        spacing: 10.h,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: AppColors.backgroundSecondary,
                      filled: true,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.textSecondary,
                      ),
                      suffixIcon: Icon(
                        Icons.tune,
                        color: AppColors.textSecondary,
                      ),
                      hint: Text(
                        'Search keywords..',
                        style: Fonts.paragraphRegular(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.backgroundSecondary,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Search history',
                        style: Fonts.titleBold(size: 18),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Clear',
                          style: Fonts.label().copyWith(
                            color: Color(0xFF407EC7),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 10.w,
                    runSpacing: 10.h,
                    children: [
                      for (String item in history)
                        Container(
                          padding: EdgeInsets.all(5),
                          color: AppColors.backgroundPrimary,
                          child: Text(
                            item,
                            style: Fonts.label(size: 10),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discover more',
                        style: Fonts.titleBold(size: 18),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Clear',
                          style: Fonts.label().copyWith(
                            color: Color(0xFF407EC7),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 10.w,
                    runSpacing: 10.h,
                    children: [
                      for (String item in discoverOptions)
                        Container(
                          padding: EdgeInsets.all(5),
                          color: AppColors.backgroundPrimary,
                          child: Text(
                            item,
                            style: Fonts.label(size: 10),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
