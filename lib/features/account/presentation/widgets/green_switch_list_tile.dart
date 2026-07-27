import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class GreenSwitchListTile extends StatelessWidget {
  String title;
  String subtitle;
  bool isActive;
  GreenSwitchListTile({
    super.key,
    required this.isActive,
    required this.title,
    required this.subtitle,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: AppColors.backgroundPrimary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              spacing: 5.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Fonts.titleBold(),
                ),
                Text(
                  subtitle,
                  style: Fonts.paragraphMedium(),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          Transform.scale(
            scale: 0.7,
            child: Switch(
              value: isActive,
              onChanged: (allowNotifications) {},
              thumbColor: WidgetStateProperty.all(
                Colors.white,
              ),
              trackColor: WidgetStateProperty.all(
                AppColors.primaryDark,
              ),
              trackOutlineColor: WidgetStateColor.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
