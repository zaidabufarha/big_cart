import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/features/buy/presentation/cubit/cubit/shop_cubit.dart';
import 'package:big_cart/features/buy/presentation/pages/category_page.dart';
import 'package:big_cart/features/buy/presentation/widgets/category_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class CategoryListPage extends StatefulWidget {
  const CategoryListPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CategoryListPageState();
  }
}

class _CategoryListPageState extends State<CategoryListPage> {
  @override
  void initState() {
    context.read<ShopCubit>().attemptGetCategoryList();
    super.initState();
  }

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
        child: BlocBuilder<ShopCubit, ShopState>(
          builder: (context, state) {
            return state.maybeWhen(
              loadedCategories: (categories) => GridView.builder(
                itemCount: categories.length,
                shrinkWrap:
                    true, //constrains height so it doesnt mess with column
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
                        builder: ((context) => CategoryPage(categories[index])),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      color: AppColors.backgroundPrimary,
                    ),
                    child: CategoryIcon(categories[index]),
                  ),
                ),
              ),
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
              error: (message) => Center(
                child: Column(
                  children: [
                    Text(message, style: Fonts.titleBold()),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.read<ShopCubit>().attemptGetCategoryList();
                      },
                      label: Text('Retry'),
                      icon: Icon(Icons.restart_alt),
                    ),
                  ],
                ),
              ),
              orElse: () => Center(
                child: Column(
                  children: [
                    Text('Something went wrong', style: Fonts.titleBold()),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.read<ShopCubit>().attemptGetCategoryList();
                      },
                      label: Text('Retry'),
                      icon: Icon(Icons.restart_alt),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
