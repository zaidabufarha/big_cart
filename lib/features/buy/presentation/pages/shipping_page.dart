import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/core/widgets/green_gradient_button.dart';
import 'package:big_cart/features/account/presentation/widgets/big_vertical_progress_indicator.dart';
import 'package:big_cart/features/buy/domain/entities/cart_item.dart';
import 'package:big_cart/features/buy/presentation/cubit/cubit/cart_cubit.dart';
import 'package:big_cart/features/buy/presentation/pages/home_page.dart';
import 'package:big_cart/features/buy/presentation/widgets/shipping_method_card.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class ShippingPage extends StatefulWidget {
  final List<CartItem> list;
  const ShippingPage(this.list, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _ShippingPageState();
  }
}

class _ShippingPageState extends State<ShippingPage> {
  int step = 1;

  bool saveAddress = false;
  bool saveCard = false;

  final formKey = GlobalKey();

  String? creditCardName;
  String? creditCardNumber;
  String? creditCardExpiration;
  String? creditCardCVV;
  bool creditCardSave = false;

  @override
  Widget build(BuildContext context) {
    void onClick(int? index) {
      setState(() {
        if (step < 3) {
          step++;
        } else {
          context.read<CartCubit>().attemptCheckOut(widget.list);
        }
      });
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
      body: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (message) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    message,
                    style: Fonts.paragraphMedium().copyWith(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            },
            success: (message) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    message,
                    style: Fonts.paragraphMedium().copyWith(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: AppColors.primaryDark,
                ),
              );
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false,
              );
            },
          );
        },
        child: Column(
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
                      child: (step == 1)
                          ? Column(
                              spacing: 10.h,
                              children: [
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
                              ],
                            )
                          : (step == 2)
                          ? Column(
                              spacing: 10.h,
                              children: [
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
                            )
                          : Column(
                              spacing: 10.h,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      child: Container(
                                        width: 100.w,
                                        height: 100.w, //so it can be a square
                                        child: Column(
                                          children: [
                                            Image.asset('assets/paypal.png'),
                                            Text(
                                              'Paypal',
                                              style: Fonts.paragraphRegular(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                    InkWell(
                                      child: Container(
                                        width: 100.w,
                                        height: 100.w, //so it can be a square
                                        child: Column(
                                          children: [
                                            Image.asset('assets/paypal.png'),
                                            Text(
                                              'Paypal',
                                              style: Fonts.paragraphRegular(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                    InkWell(
                                      child: Container(
                                        width: 100.w,
                                        height: 100.w, //so it can be a square
                                        child: Column(
                                          children: [
                                            Image.asset('assets/paypal.png'),
                                            Text(
                                              'Paypal',
                                              style: Fonts.paragraphRegular(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Cannot be empty';
                                    }
                                    return null;
                                  },
                                  onSaved: (newValue) {
                                    creditCardName = newValue!;
                                  },
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Cannot be empty';
                                    }
                                    return null;
                                  },
                                  onSaved: (newValue) {
                                    creditCardNumber = newValue!;
                                  },
                                ),
                                Row(
                                  spacing: 10.w,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor:
                                              AppColors.backgroundPrimary,
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
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Cannot be empty';
                                          }
                                          return null;
                                        },
                                        onSaved: (newValue) {
                                          creditCardExpiration = newValue!;
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        keyboardType:
                                            TextInputType.numberWithOptions(),
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor:
                                              AppColors.backgroundPrimary,
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
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Cannot be empty';
                                          }
                                          return null;
                                        },
                                        onSaved: (newValue) {
                                          creditCardCVV = newValue;
                                        },
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
                                          value: creditCardSave,
                                          title: Text(
                                            'Make default',
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
                                          onChanged: (save) {
                                            setState(() {
                                              creditCardSave = save;
                                            });
                                          },
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
              child: GreenGradientButton(
                onClick,
                (step == 3) ? 'Make a payment' : 'Next',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
