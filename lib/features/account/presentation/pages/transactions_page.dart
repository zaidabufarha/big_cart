import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/features/account/domain/entities/transaction.dart';
import 'package:big_cart/features/account/presentation/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class TransactionsPage extends StatelessWidget {
  bool allowNotifications = true;
  bool allowEmailNotifications = true;
  bool allowOrderNotifications = true;
  bool allowGeneralNotifications = true;

  List<Transaction> transactionList;
  TransactionsPage(this.transactionList, {super.key});
  @override
  Widget build(BuildContext context) {
    transactionList.add(
      Transaction(
        cost: 89,
        timestamp: DateTime.now(),
        proccessor: paymentProccessor.mastercard,
      ),
    );

    transactionList.add(
      Transaction(
        cost: 109,
        timestamp: DateTime.now(),
        proccessor: paymentProccessor.visa,
      ),
    );
    transactionList.add(
      Transaction(
        cost: 567,
        timestamp: DateTime.now(),
        proccessor: paymentProccessor.paypal,
      ),
    );

    void onClick(int? index) {}

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundPrimary,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),

        centerTitle: true,
        title: Text(
          'Transactions',
          style: Fonts.titleBold(size: 20),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20.h,
            children: [
              for (Transaction transaction in transactionList)
                TransactionCard(transaction),
            ],
          ),
        ),
      ),
    );
  }
}
