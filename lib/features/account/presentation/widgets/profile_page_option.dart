import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class ProfilePageOption extends StatelessWidget {
  IconData icon;
  String text;
  Widget destination;
  ProfilePageOption({
    super.key,
    required this.icon,
    required this.text,
    required this.destination,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.primaryDark,
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: ((context) => destination)));
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 20.w,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: AppColors.primaryDark,
                size: 30.r,
              ),
              Text(
                text,
                style: Fonts.titleBold(size: 20),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.textSecondary,
            size: 30.r,
          ),
        ],
      ),
    );
  }
}
