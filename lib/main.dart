import 'package:big_cart/di/injection.dart';
import 'package:big_cart/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:big_cart/features/auth/presentation/pages/splash_screen.dart';
import 'package:big_cart/features/buy/presentation/pages/cart_page.dart';
import 'package:big_cart/features/buy/presentation/pages/review_page.dart';
import 'package:big_cart/features/buy/presentation/pages/search_page.dart';
import 'package:big_cart/features/buy/presentation/pages/shipping_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await configureDependencies();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthCubit>()..checkIfLoggedIn(),
        ),
      ],
      child: MaterialApp(home: SplashScreen(0)),
    );
  }
}
