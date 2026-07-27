import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/core/widgets/green_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class AddCreditCardPage extends StatelessWidget {
  bool saveCard = true;
  final formKey = GlobalKey();
  AddCreditCardPage({super.key});
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
          'Add Credit Card',
          style: Fonts.titleBold(size: 20),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  spacing: 10.h,
                  children: [
                    Image.asset(
                      'assets/card_picture.png',
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
                          Icons.credit_card_outlined,
                          color: AppColors.textSecondary,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hint: Text(
                          'XXXX XXXX XXXX 5678',
                          style: Fonts.paragraphRegular(),
                        ),
                      ),
                    ),
                    Row(
                      spacing: 10.w,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.backgroundPrimary,
                              prefixIcon: Icon(
                                Icons.calendar_today_outlined,
                                color: AppColors.textSecondary,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              hint: Text(
                                '01/22',
                                style: Fonts.paragraphRegular(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
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
                                '908',
                                style: Fonts.paragraphRegular(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: Transform.scale(
                            alignment: Alignment.centerLeft,
                            scale: 0.8,
                            child: SwitchListTile(
                              value: saveCard,
                              title: Text(
                                'Make default',
                                style: Fonts.titleBold(),
                              ),
                              contentPadding: EdgeInsets.all(0),
                              controlAffinity: ListTileControlAffinity.leading,
                              thumbColor: WidgetStateProperty.all(
                                Colors.white,
                              ),
                              trackColor: WidgetStateProperty.all(
                                AppColors.primaryDark,
                              ),
                              dense: true,
                              visualDensity: VisualDensity.compact,
                              trackOutlineColor: WidgetStateColor.transparent,
                              onChanged: (isDefault) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
