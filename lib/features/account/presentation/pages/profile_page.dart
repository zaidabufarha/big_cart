import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/features/account/domain/entities/user.dart';
import 'package:big_cart/features/account/presentation/pages/about_page.dart';
import 'package:big_cart/features/account/presentation/pages/address_page.dart';
import 'package:big_cart/features/account/presentation/pages/cards_page.dart';
import 'package:big_cart/features/account/presentation/pages/notifications_page.dart';
import 'package:big_cart/features/account/presentation/pages/order_page.dart';
import 'package:big_cart/features/account/presentation/pages/transactions_page.dart';
import 'package:big_cart/features/account/presentation/widgets/profile_page_option.dart';
import 'package:big_cart/features/buy/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final exampleUser = User(
    name: 'Olivia Austin',
    email: 'oliviaaustin@gmail.com',
    number: '+1 202 555 0142',
    password: 'foenem',
    imagePath: 'assets/profile_picture.jpg',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 85.w,
        height: 85.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryDark,
          border: Border.all(width: 10.w, color: Colors.white),
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      bottomNavigationBar: NavigationBar(
        labelPadding: EdgeInsets.only(top: 40),
        height: 30.h,
        // i "show" the labels so i can push the icons up. not visible which is what i want
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        labelTextStyle: WidgetStateProperty.all(TextStyle(fontSize: 1.sp)),
        backgroundColor: Colors.white,
        indicatorColor: Colors.transparent,
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              color: AppColors.textSecondary,
              size: 30.r,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outline,
              color: AppColors.textPrimary,

              size: 30.r,
            ),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.favorite_outline,
              color: AppColors.textSecondary,
              size: 30.r,
            ),
            label: 'Favorites',
          ),
          SizedBox(),
        ],
      ),

      backgroundColor: AppColors.backgroundPrimary,
      body: Stack(
        children: [
          Positioned(
            bottom: 20.h,
            left: 0,
            right: 0,
            top: 200.h,
            child: Container(
              padding: EdgeInsets.all(30),
              width: double.infinity,
              color: AppColors.backgroundSecondary,
              child: Column(
                spacing: 20.h,
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  ProfilePageOption(
                    icon: Icons.person_outline,
                    text: 'About me',
                    destination: AboutPage(),
                  ),
                  ProfilePageOption(
                    icon: Icons.inventory_2_outlined,
                    text: 'My Orders',
                    destination: OrderPage(exampleUser.orderList),
                  ),
                  ProfilePageOption(
                    icon: Icons.favorite_outline,
                    text: 'My Favorites',
                    destination: HomePage(),
                  ),
                  ProfilePageOption(
                    icon: Icons.location_on_outlined,
                    text: 'My Address',
                    destination: AddressPage(exampleUser.addressList),
                  ),
                  ProfilePageOption(
                    icon: Icons.credit_card_outlined,
                    text: 'Credit Cards',
                    destination: CardsPage(exampleUser.creditCardList),
                  ),
                  ProfilePageOption(
                    icon: Icons.attach_money,
                    text: 'Transactions',
                    destination: TransactionsPage(exampleUser.transactionList),
                  ),
                  ProfilePageOption(
                    icon: Icons.notifications_outlined,
                    text: 'Notifications',
                    destination: NotificationsPage(),
                  ),
                  ProfilePageOption(
                    icon: Icons.logout_rounded,
                    text: 'Sign out',
                    destination: HomePage(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 120.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 67.r,
                  backgroundImage: AssetImage(
                    (exampleUser.imagePath != null)
                        ? exampleUser.imagePath
                        : 'assets/blank_profile_picture.png',
                  ),
                ),
                Text(
                  exampleUser.name,
                  style: Fonts.titleBold(),
                ),
                Text(
                  exampleUser.email,
                  style: Fonts.paragraphRegular(),
                ),
              ],
            ),
          ),
          Positioned(
            top: 210.h,
            left: 230.w,
            child: Container(
              width: 30.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryDark,
              ),
              child: IconButton(
                padding: EdgeInsets.only(right: 0.w),
                onPressed: () {},
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 19.r,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
