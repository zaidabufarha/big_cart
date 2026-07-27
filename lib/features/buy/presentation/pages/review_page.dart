import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/core/widgets/green_gradient_button.dart';
import 'package:big_cart/features/account/domain/entities/user.dart';
import 'package:big_cart/features/account/presentation/pages/add_credit_card_page.dart';
import 'package:big_cart/features/buy/domain/entities/product.dart';
import 'package:big_cart/features/buy/domain/entities/review.dart';
import 'package:big_cart/features/buy/presentation/pages/add_review_page.dart';
import 'package:big_cart/features/buy/presentation/widgets/review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar_plus/flutter_rating_bar_plus.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class ReviewPage extends StatelessWidget {
  final exampleUser = User(
    name: 'Olivia Austin',
    email: 'oliviaaustin@gmail.com',
    number: '+1 202 555 0142',
    password: 'foenem',
  );
  final exampleUser2 = User(
    name: 'Carla Septimus',
    email: 'csus@gmail.com',
    number: '+1 202 999 0142',
    password: 'foenem',
  );
  final exampleUser3 = User(
    name: 'Austinivia Popay',
    email: 'jdsij@gmail.com',
    number: '+1 324 329 0142',
    password: 'foenem',
    imagePath: 'assets/profile_picture.jpg',
  );
  List<Review> reviewList;
  ReviewPage(this.reviewList, {super.key});
  @override
  Widget build(BuildContext context) {
    reviewList.add(
      Review(
        user: exampleUser,
        content: 'whatdatmean',
        rating: 3.3,
        timestamp: DateTime.now(),
      ),
    );

    reviewList.add(
      Review(
        user: exampleUser2,
        content:
            'very good lemon it changed my life forever and ever and ever and ever and ever and ever and ever and ever and ever and ever and ever and ever and ever and ever and ever and ever',
        rating: 4.6,
        timestamp: DateTime.now(),
      ),
    );
    reviewList.add(
      Review(
        user: exampleUser3,
        content: 'atrocious lemons, very bad, not good',
        rating: 1.9,
        timestamp: DateTime.now(),
      ),
    );

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
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(
                MaterialPageRoute(builder: (context) => AddReviewPage()),
              );
            },
            icon: Icon(Icons.add_circle_outline),
          ),
        ],
        centerTitle: true,
        title: Text(
          'Reviews',
          style: Fonts.titleBold(size: 20),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10.h,

            children: [for (Review review in reviewList) ReviewCard(review)],
          ),
        ),
      ),
    );
  }
}
