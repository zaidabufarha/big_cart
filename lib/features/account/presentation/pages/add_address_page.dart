import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/core/widgets/green_gradient_button.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class AddAddressPage extends StatelessWidget {
  bool saveCard = true;
  final formKey = GlobalKey();
  AddAddressPage({super.key});
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
          'Add Address',
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              value: saveCard,
                              title: Text(
                                'Save this address',
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
