import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/features/account/domain/entities/address.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class AddressCard extends StatelessWidget {
  final formKey = GlobalKey();
  bool isDefault = true;
  bool isClosed;
  Address address;
  AddressCard.closed(this.address, {super.key}) : isClosed = true;
  AddressCard.open(this.address, {super.key}) : isClosed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.backgroundPrimary,
      child: Column(
        spacing: 7.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColors.primaryLight,
            child: Text(
              'DEFAULT',
              style: Fonts.label().copyWith(
                color: AppColors.primaryDark,
              ),
            ),
          ),
          Row(
            spacing: 10.w,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.only(left: 5.w),
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.location_on_outlined,
                  size: 40.r,
                ),
              ),
              Expanded(
                child: Column(
                  spacing: 3.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name,
                      style: Fonts.titleBold(),
                    ),
                    Text(
                      address.address,
                      style: Fonts.paragraphRegular(size: 12),
                    ),
                    Text(
                      '${address.city}, ${address.country} ${address.zip}',
                      style: Fonts.paragraphRegular(size: 12),
                    ),
                    Text(
                      address.number,
                      style: Fonts.titleBold(size: 12),
                    ),
                  ],
                ),
              ),
              Transform.rotate(
                //there is no identical up arrow so I'll just make my own
                angle: (!isClosed) ? 3.14159 : 0,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: AppColors.primaryDark,
                    size: 30.r,
                  ),
                ),
              ),
            ],
          ),
          (!isClosed)
              ? Divider(
                  thickness: 1.h,
                )
              : SizedBox(),

          (!isClosed)
              ? Form(
                  key: formKey,

                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      spacing: 5.h,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.backgroundSecondary,
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: AppColors.textSecondary,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hint: Text(
                              'Name',
                              style: Fonts.paragraphRegular(),
                            ),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.backgroundSecondary,
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
                        Row(
                          spacing: 10.w,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.backgroundSecondary,
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
                            ),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.backgroundSecondary,
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
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.backgroundSecondary,
                            prefixIcon: Icon(
                              Icons.language_outlined,
                              color: AppColors.textSecondary,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hint: Text(
                              'Country',
                              style: Fonts.paragraphRegular(),
                            ),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.backgroundSecondary,
                            prefixIcon: Icon(
                              Icons.person_outline,
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
                        Row(
                          children: [
                            Expanded(
                              child: Transform.scale(
                                alignment: Alignment.centerLeft,
                                scale: 0.8,
                                child: SwitchListTile(
                                  value: isDefault,
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
                                  onChanged: (isDefault) {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
