import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/core/widgets/green_gradient_button.dart';
import 'package:big_cart/features/account/domain/entities/credit_card.dart';
import 'package:big_cart/features/account/domain/entities/transaction.dart';
import 'package:big_cart/features/account/presentation/pages/add_credit_card_page.dart';
import 'package:big_cart/features/account/presentation/widgets/credit_card_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class CardsPage extends StatelessWidget {
  List<CreditCard> cardList;
  CardsPage(this.cardList, {super.key});
  @override
  Widget build(BuildContext context) {
    void onClick(int? index) {}

    cardList.add(
      CreditCard(
        name: 'dog',
        cardNumber: '6767 6767 6767 6767',
        expiryDate: '01/34',
        cvv: '823',
        proccessor: paymentProccessor.mastercard,
      ),
    );
    cardList.add(
      CreditCard(
        name: 'cat',
        cardNumber: '2121 2121 2121 2121',
        expiryDate: '09/34',
        cvv: '364',
        proccessor: paymentProccessor.visa,
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
              ).push(
                MaterialPageRoute(builder: (context) => AddCreditCardPage()),
              );
            },
            icon: Icon(Icons.add_circle_outline),
          ),
        ],
        centerTitle: true,
        title: Text(
          'My Cards',
          style: Fonts.titleBold(size: 20),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Column(
                  spacing: 10.h,

                  children: [
                    CreditCardCard.open(cardList[0]),
                    CreditCardCard.closed(cardList[1]),
                  ],
                ),
              ),
              GreenGradientButton(onClick, 'Save settings'),
            ],
          ),
        ),
      ),
    );
  }
}
