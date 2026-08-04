import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/features/buy/domain/entities/category.dart';
import 'package:big_cart/features/buy/domain/entities/product.dart';
import 'package:big_cart/features/buy/presentation/cubit/cubit/shop_cubit.dart';
import 'package:big_cart/features/buy/presentation/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatefulWidget {
  Category? category;
  String? searchTerm;
  CategoryPage(this.category, {super.key});
  CategoryPage.search(this.searchTerm, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _CategoryPageState();
  }
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    context.read<ShopCubit>().attemptGetProductList();
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
        title: Text(
          (widget.category != null)
              ? widget.category!.name
              : widget.searchTerm!,
        ),
        backgroundColor: AppColors.backgroundPrimary,
      ),
      backgroundColor: AppColors.backgroundSecondary,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<ShopCubit, ShopState>(
          builder: (context, state) {
            return state.maybeWhen(
              loadedProducts: (products) {
                List<Product> filteredList = [];
                if (widget.category != null) {
                  filteredList = products
                      .where(
                        (product) =>
                            (product.category.name == widget.category!.name),
                      )
                      .toList();
                } else {
                  filteredList = products
                      .where(
                        (product) => (product.name.toLowerCase().contains(
                          widget.searchTerm!.toLowerCase(),
                        )),
                      )
                      .toList();
                }

                return SingleChildScrollView(
                  child: ProductList(filteredList),
                );
              },
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
              error: (message) => Center(
                child: Column(
                  children: [
                    Text(message, style: Fonts.titleBold()),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.read<ShopCubit>().attemptGetProductList();
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
                        context.read<ShopCubit>().attemptGetProductList();
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
