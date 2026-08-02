import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/core/widgets/green_gradient_button.dart';
import 'package:big_cart/features/account/domain/entities/credit_card.dart';
import 'package:big_cart/features/account/presentation/cubit/cubit/cards_cubit.dart';
import 'package:big_cart/features/account/presentation/pages/add_credit_card_page.dart';
import 'package:big_cart/features/account/presentation/widgets/credit_card_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _CardsPageState();
  }
}

class _CardsPageState extends State<CardsPage> {
  late List<CreditCard> list;
  final formKey = GlobalKey<FormState>();
  bool hasBeenLoaded = false;

  @override
  void initState() {
    context.read<CardsCubit>().attemptGetCreditCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void onClick(int? index) {
      bool isValid = formKey.currentState!.validate();
      if (isValid) {
        formKey.currentState!.save();
        for (CreditCard card in list) {
          context.read<CardsCubit>().attemptUpdateCreditCard(card: card);
        }
        hasBeenLoaded = false;
      }
    }

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
        child: BlocConsumer<CardsCubit, CardsState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (cards) {
                if (!hasBeenLoaded) list = cards;
                hasBeenLoaded = true;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Form(
                          //form can include child widgets
                          key: formKey,
                          child: Column(
                            spacing: 10.h,
                            children: [
                              for (int i = 0; i < list.length; i++)
                                CreditCardCard(list[i], (updatedCard) {
                                  setState(() {
                                    list[i] = updatedCard;
                                    if (updatedCard.isDefault) {
                                      for (int j = 0; j < list.length; j++) {
                                        if (j != i) list[j].isDefault = false;
                                      }
                                    }
                                  });
                                }),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GreenGradientButton(onClick, 'Save settings'),
                  ],
                );
              },
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
              orElse: () => Column(
                children: [
                  Text('Something went wrong'),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<CardsCubit>().attemptGetCreditCards();
                    },
                    label: Text(
                      'Retry',
                      style: Fonts.paragraphMedium(),
                    ),
                    icon: Icon(Icons.restart_alt),
                  ),
                ],
              ),
            );
          },
          listener: (context, state) {
            state.maybeWhen(
              loaded: (cards) {
                hasBeenLoaded = false;
              },
              orElse: () {},
            );
          },
        ),
      ),
    );
  }
}
