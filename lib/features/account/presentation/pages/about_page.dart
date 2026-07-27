import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/core/widgets/green_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class AboutPage extends StatelessWidget {
  final formKey = GlobalKey();
  AboutPage({super.key});
  @override
  Widget build(BuildContext context) {
    void onClick(int? index) {}
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundSecondary,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),

        centerTitle: true,
        title: Text(
          'About me',
          style: Fonts.titleBold(size: 20),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.all(20),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10.h,
                    children: [
                      Text(
                        'Personal Details',
                        style: Fonts.titleBold(size: 20),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.backgroundPrimary,
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: AppColors.textSecondary,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hint: Text(
                            'Russel Austin',
                            style: Fonts.paragraphRegular(),
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.backgroundPrimary,
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: AppColors.textSecondary,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hint: Text(
                            'russel.partner@gmail.com',
                            style: Fonts.paragraphRegular(),
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.backgroundPrimary,
                          prefixIcon: Icon(
                            Icons.phone_outlined,
                            color: AppColors.textSecondary,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hint: Text(
                            '+1 202 555 0142',
                            style: Fonts.paragraphRegular(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Text(
                        'Personal Details',
                        style: Fonts.titleBold(size: 20),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.backgroundPrimary,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: AppColors.textSecondary,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hint: Text(
                            'Current password',
                            style: Fonts.paragraphRegular(),
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.backgroundPrimary,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: AppColors.textSecondary,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hint: Text(
                            '● ● ● ● ●',
                            style: Fonts.paragraphRegular(),
                          ),
                        ),
                        obscureText: true,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.backgroundPrimary,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: AppColors.textSecondary,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hint: Text(
                            'Confirm password',
                            style: Fonts.paragraphRegular(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
