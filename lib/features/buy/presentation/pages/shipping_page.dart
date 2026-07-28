import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/core/widgets/green_gradient_button.dart';
import 'package:big_cart/features/account/presentation/widgets/big_vertical_progress_indicator.dart';
import 'package:big_cart/features/buy/presentation/widgets/shipping_method_card.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class ShippingPage extends StatelessWidget {
  bool saveAddress = false;
  int step = 2;
  final formKey = GlobalKey();
  ShippingPage({super.key});
  @override
  Widget build(BuildContext context) {
    void onClick(int? index) {
      if (step == 1) {
        step++;
      } else {
        print('payment screen');
      }
    }

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
          'Add Address',
          style: Fonts.titleBold(size: 20),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    BigVerticalProgressIndicator(
                      isActive: true,
                      isFirst: true,
                      number: 1,
                      label: 'PAYMENT',
                      isComplete: (step == 1) ? false : true,
                    ),
                    BigVerticalProgressIndicator(
                      isActive: (step >= 2),
                      isFirst: false,
                      number: 2,
                      label: 'PAYMENT',
                      isComplete: (step > 2) ? true : false,
                    ),
                    BigVerticalProgressIndicator(
                      isActive: false,
                      isFirst: false,
                      number: 3,
                      label: 'PAYMENT',
                      isComplete: false,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.all(20),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      spacing: 10.h,
                      children: (step == 1)
                          ? [
                              ShippingMethodCard(
                                price: 3,
                                title: 'Standard Delivery',
                                description:
                                    'Order will be delivered between 3 - 4 business days straights to your doorstep.',
                              ),
                              ShippingMethodCard(
                                price: 3,
                                title: 'Next Day Delivery',
                                description:
                                    'Order will be delivered between 3 - 4 business days straights to your doorstep.',
                              ),
                              ShippingMethodCard(
                                price: 3,
                                title: 'Nominated Delivery',
                                description:
                                    'Order will be delivered between 3 - 4 business days straights to your doorstep.',
                              ),
                            ]
                          : [
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
                                    'Email address',
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
                                    'Phone number',
                                    style: Fonts.paragraphRegular(),
                                  ),
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.backgroundPrimary,
                                  prefixIcon: Icon(
                                    Icons.location_on_outlined,
                                    color: AppColors.textSecondary,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hint: Text(
                                    'Address',
                                    style: Fonts.paragraphRegular(),
                                  ),
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.backgroundPrimary,
                                  prefixIcon: Icon(
                                    Icons.pin_outlined,
                                    color: AppColors.textSecondary,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hint: Text(
                                    'Zip code',
                                    style: Fonts.paragraphRegular(),
                                  ),
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.backgroundPrimary,
                                  prefixIcon: Icon(
                                    Icons.map_outlined,
                                    color: AppColors.textSecondary,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hint: Text(
                                    'City',
                                    style: Fonts.paragraphRegular(),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showCountryPicker(
                                    context: context,
                                    showPhoneCode: false,
                                    onSelect: (Country country) {
                                      print('selected ${country.name}');
                                    },
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  color: AppColors.backgroundPrimary,
                                  padding: EdgeInsets.all(10),
                                  height: 56.h,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        spacing: 12.w,
                                        children: [
                                          Icon(
                                            Icons.language,
                                            color: AppColors.textSecondary,
                                          ),
                                          Text(
                                            'Country',
                                            style: Fonts.paragraphRegular(),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: AppColors.textSecondary,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Transform.scale(
                                      alignment: Alignment.centerLeft,
                                      scale: 0.8,
                                      child: SwitchListTile(
                                        value: saveAddress,
                                        title: Text(
                                          'Save this address',
                                          style: Fonts.titleBold(),
                                        ),
                                        contentPadding: EdgeInsets.all(0),
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        thumbColor: WidgetStateProperty.all(
                                          Colors.white,
                                        ),
                                        trackColor: WidgetStateProperty.all(
                                          AppColors.primaryDark,
                                        ),
                                        dense: true,
                                        visualDensity: VisualDensity.compact,
                                        trackOutlineColor:
                                            WidgetStateColor.transparent,
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
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: GreenGradientButton(onClick, 'Next'),
          ),
        ],
      ),
    );
  }
}
