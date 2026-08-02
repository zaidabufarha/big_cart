import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/features/account/domain/entities/address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class AddressCard extends StatefulWidget {
  final formKey = GlobalKey();
  final Function(Address updatedAddress) onChanged;

  final Address address;

  AddressCard(this.address, this.onChanged, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddressCardState();
  }
}

class _AddressCardState extends State<AddressCard> {
  bool isClosed = true;
  late bool isDefault;
  late String name;
  late String address;
  late String city;
  late String zip;
  late String country;
  late String number;
  @override
  void initState() {
    isDefault = widget.address.isDefault;
    name = widget.address.name;
    address = widget.address.address;
    city = widget.address.city;
    zip = widget.address.zip;
    country = widget.address.country;
    number = widget.address.number;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.backgroundPrimary,
      child: Column(
        spacing: 7.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (isDefault)
              ? Container(
                  color: AppColors.primaryLight,
                  child: Text(
                    'DEFAULT',
                    style: Fonts.label().copyWith(
                      color: AppColors.primaryDark,
                    ),
                  ),
                )
              : SizedBox(),
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
                      name,
                      style: Fonts.titleBold(),
                    ),
                    Text(
                      address,
                      style: Fonts.paragraphRegular(size: 12),
                    ),
                    Text(
                      '$city, $country $zip',
                      style: Fonts.paragraphRegular(size: 12),
                    ),
                    Text(
                      number,
                      style: Fonts.titleBold(size: 12),
                    ),
                  ],
                ),
              ),
              Transform.rotate(
                //there is no identical up arrow so I'll just make my own
                angle: (!isClosed) ? 3.14159 : 0,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isClosed = !isClosed;
                    });
                  },
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
              ? Padding(
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Cannot be empty';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (newValue) {
                          name = newValue!;
                          widget.onChanged(
                            Address(
                              name: name,
                              address: address,
                              city: city,
                              country: country,
                              number: number,
                              zip: zip,
                              id: widget.address.id,
                              isDefault: isDefault,
                            ),
                          );
                        },
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Cannot be empty';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (newValue) {
                          address = newValue!;
                          widget.onChanged(
                            Address(
                              name: name,
                              address: address,
                              city: city,
                              country: country,
                              number: number,
                              zip: zip,
                              id: widget.address.id,
                              isDefault: isDefault,
                            ),
                          );
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Cannot be empty';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (newValue) {
                                city = newValue!;
                                widget.onChanged(
                                  Address(
                                    name: name,
                                    address: address,
                                    city: city,
                                    country: country,
                                    number: number,
                                    zip: zip,
                                    id: widget.address.id,
                                    isDefault: isDefault,
                                  ),
                                );
                              },
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Cannot be empty';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (newValue) {
                                zip = newValue!;
                                widget.onChanged(
                                  Address(
                                    name: name,
                                    address: address,
                                    city: city,
                                    country: country,
                                    number: number,
                                    zip: zip,
                                    id: widget.address.id,
                                    isDefault: isDefault,
                                  ),
                                );
                              },
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Cannot be empty';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (newValue) {
                          number = newValue!;
                          widget.onChanged(
                            Address(
                              name: name,
                              address: address,
                              city: city,
                              country: country,
                              number: number,
                              zip: zip,
                              id: widget.address.id,
                              isDefault: isDefault,
                            ),
                          );
                        },
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
                                trackOutlineColor: WidgetStateColor.transparent,
                                onChanged: (val) {
                                  setState(() {
                                    isDefault = val;
                                  });
                                  widget.onChanged(
                                    Address(
                                      name: name,
                                      address: address,
                                      city: city,
                                      country: country,
                                      number: number,
                                      zip: zip,
                                      id: widget.address.id,
                                      isDefault: val,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
