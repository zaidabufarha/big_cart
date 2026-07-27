import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/core/widgets/green_gradient_button.dart';
import 'package:big_cart/features/account/presentation/widgets/green_switch_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class NotificationsPage extends StatelessWidget {
  bool allowNotifications = true;
  bool allowEmailNotifications = true;
  bool allowOrderNotifications = true;
  bool allowGeneralNotifications = true;

  NotificationsPage({super.key});
  @override
  Widget build(BuildContext context) {
    void onClick(int? index) {}

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundPrimary,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),

        centerTitle: true,
        title: Text(
          'My Orders',
          style: Fonts.titleBold(size: 20),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: SingleChildScrollView(
              child: Column(
                spacing: 10.h,
                children: [
                  GreenSwitchListTile(
                    isActive: allowNotifications,
                    title: 'Allow Notifications',
                    subtitle:
                        'Lorem ipsum dolor sit amet, consetetur sadi pscing elitr, sed diam nonumym',
                  ),
                  GreenSwitchListTile(
                    isActive: allowEmailNotifications,
                    title: 'Email Notifications',
                    subtitle:
                        'Lorem ipsum dolor sit amet, consetetur sadi pscing elitr, sed diam nonumym',
                  ),
                  GreenSwitchListTile(
                    isActive: allowOrderNotifications,
                    title: 'Order Notifications',
                    subtitle:
                        'Lorem ipsum dolor sit amet, consetetur sadi pscing elitr, sed diam nonumym',
                  ),
                  GreenSwitchListTile(
                    isActive: allowGeneralNotifications,
                    title: 'General Notifications',
                    subtitle:
                        'Lorem ipsum dolor sit amet, consetetur sadi pscing elitr, sed diam nonumym',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GreenGradientButton(onClick, 'Save settings'),
          ),
        ],
      ),
    );
  }
}
