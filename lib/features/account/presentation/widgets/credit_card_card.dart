import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/features/account/domain/entities/address.dart';
import 'package:big_cart/features/account/domain/entities/credit_card.dart';
import 'package:big_cart/features/account/domain/entities/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class CreditCardCard extends StatelessWidget {
  final formKey = GlobalKey();
  bool isDefault = true;
  bool isClosed;
  CreditCard card;
  CreditCardCard.closed(this.card, {super.key}) : isClosed = true;
  CreditCardCard.open(this.card, {super.key}) : isClosed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.backgroundPrimary,
      child: Column(
        spacing: 10.h,
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
                width: 80.w,
                height: 80.h,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.backgroundTertiary,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        (card.proccessor == paymentProccessor.mastercard)
                            ? 'assets/mastercard.png'
                            : (card.proccessor == paymentProccessor.visa)
                            ? 'assets/visa.png'
                            : 'assets/paypal.png',
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  spacing: 3.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (card.proccessor == paymentProccessor.mastercard)
                          ? 'Master Card'
                          : 'Visa', //no paypal card because it's external
                      style: Fonts.titleBold(),
                    ),
                    Text(
                      card.cardNumber,
                      style: Fonts.paragraphRegular(size: 12),
                    ),
                    Row(
                      spacing: 10.w,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: 'Expiry: ',
                            style: Fonts.label().copyWith(
                              color: AppColors.textPrimary,
                            ),
                            children: [
                              TextSpan(
                                text: card.expiryDate,
                                style: Fonts.label().copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'CCV: ',
                            style: Fonts.label().copyWith(
                              color: AppColors.textPrimary,
                            ),
                            children: [
                              TextSpan(
                                text: card.cvv,
                                style: Fonts.label().copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                              'Russel Austin',
                              style: Fonts.paragraphRegular(),
                            ),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.backgroundSecondary,
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
                                  fillColor: AppColors.backgroundSecondary,
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
                                  fillColor: AppColors.backgroundSecondary,
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
