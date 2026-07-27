import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/core/widgets/green_gradient_button.dart';
import 'package:big_cart/features/account/domain/entities/address.dart';
import 'package:big_cart/features/account/presentation/pages/add_address_page.dart';
import 'package:big_cart/features/account/presentation/widgets/address_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class AddressPage extends StatelessWidget {
  List<Address> addressList;
  AddressPage(this.addressList, {super.key});
  @override
  Widget build(BuildContext context) {
    void onClick(int? index) {}
    addressList.add(
      Address(
        name: 'Jissica Simpson',
        address: '2811 Crescent Day. LA Port',
        city: 'California',
        country: 'United States',
        number: '+1 202 555 0142',
        zip: '77571',
      ),
    );
    addressList.add(
      Address(
        name: 'Russel Austin',
        address: '2811 Crescent Day. LA Port',
        city: 'California',
        country: 'United States',
        number: '+1 202 555 0142',
        zip: '77571',
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundPrimary,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => AddAddressPage()));
            },
            icon: Icon(Icons.add_circle_outline),
          ),
        ],
        centerTitle: true,
        title: Text(
          'My Address',
          style: Fonts.titleBold(size: 20),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10.h,
            children: [
              AddressCard.open(addressList[0]),
              AddressCard.closed(addressList[1]),
              GreenGradientButton(onClick, 'Save settings'),
            ],
          ),
        ),
      ),
    );
  }
}
