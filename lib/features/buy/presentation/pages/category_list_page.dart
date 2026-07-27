import 'package:big_cart/core/colors.dart';
import 'package:big_cart/features/buy/domain/entities/category.dart';
import 'package:big_cart/features/buy/domain/entities/product.dart';
import 'package:big_cart/features/buy/presentation/pages/category_page.dart';
import 'package:big_cart/features/buy/presentation/widgets/category_icon.dart';
import 'package:big_cart/features/buy/presentation/widgets/product_card.dart';
import 'package:big_cart/features/buy/presentation/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class CategoryListPage extends StatelessWidget {
  const CategoryListPage({super.key});

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
        title: Text('Categories'),
        backgroundColor: AppColors.backgroundPrimary,
      ),
      backgroundColor: AppColors.backgroundSecondary,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: categoryList.length,
          shrinkWrap: true, //constrains height so it doesnt mess with column
          physics:
              NeverScrollableScrollPhysics(), //already scroll with singlechild
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 15.w,
            mainAxisSpacing: 15.h,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => CategoryPage(productList)),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                color: AppColors.backgroundPrimary,
              ),
              child: CategoryIcon(categoryList[index]),
            ),
          ),
        ),
      ),
    );
  }
}
