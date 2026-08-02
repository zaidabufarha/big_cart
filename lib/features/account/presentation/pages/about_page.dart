import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/core/widgets/green_gradient_button.dart';
import 'package:big_cart/features/account/presentation/cubit/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _AboutPageState();
  }
}

class _AboutPageState extends State<AboutPage> {
  final formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  late String name;
  late String email;
  late String phoneNumber;
  late String currentPassword;
  late String newPassword1;
  late String newPassword2;

  @override
  Widget build(BuildContext context) {
    void onClick(int? index) {
      bool isValid = formKey.currentState!.validate();
      if (isValid) {
        formKey.currentState!.save();
        context.read<UserCubit>().attemptUpdateProfile(
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          currentPassword: currentPassword,
          newPassword1: newPassword1,
          newPassword2: newPassword2,
        );
      }
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
          'About me',
          style: Fonts.titleBold(size: 20),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.all(20),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10.h,
                    children: [
                      Text(
                        'Personal Details',
                        style: Fonts.titleBold(size: 20),
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
                        validator: (newName) {
                          if (newName == null || newName.isEmpty) {
                            return 'Cannot be empty';
                          }
                          return null;
                        },
                        onSaved: (newName) {
                          name = newName!;
                        },
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
                            'russel.partner@gmail.com',
                            style: Fonts.paragraphRegular(),
                          ),
                        ),
                        validator: (newEmail) {
                          if (newEmail == null || newEmail.isEmpty) {
                            return 'Cannot be empty';
                          }
                          return null;
                        },
                        onSaved: (newEmail) {
                          email = newEmail!;
                        },
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
                            '+1 202 555 0142',
                            style: Fonts.paragraphRegular(),
                          ),
                        ),
                        validator: (newNumber) {
                          if (newNumber == null || newNumber.isEmpty) {
                            return 'Cannot be empty';
                          }
                          return null;
                        },
                        onSaved: (newNumber) {
                          phoneNumber = newNumber!;
                        },
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Text(
                        'Change Password',
                        style: Fonts.titleBold(size: 20),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.backgroundPrimary,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: AppColors.textSecondary,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hint: Text(
                            'Current password',
                            style: Fonts.paragraphRegular(),
                          ),
                        ),
                        validator: (current) {
                          if (current == null || current.isEmpty) {
                            return 'Cannot be empty';
                          }
                          return null;
                        },
                        onSaved: (current) {
                          currentPassword = current!;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.backgroundPrimary,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: AppColors.textSecondary,
                          ),
                          suffix: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            icon: (hidePassword)
                                ? Icon(Icons.visibility_outlined)
                                : Icon(Icons.visibility_off_outlined),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hint: Text(
                            '● ● ● ● ●',
                            style: Fonts.paragraphRegular(),
                          ),
                        ),
                        obscureText: hidePassword,
                        validator: (newPassword) {
                          if (newPassword == null || newPassword.isEmpty) {
                            return 'Cannot be empty';
                          }
                          return null;
                        },
                        onSaved: (newPassword) {
                          newPassword1 = newPassword!;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.backgroundPrimary,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: AppColors.textSecondary,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hint: Text(
                            'Confirm password',
                            style: Fonts.paragraphRegular(),
                          ),
                        ),
                        validator: (newPassword) {
                          if (newPassword == null || newPassword.isEmpty) {
                            return 'Cannot be empty';
                          }
                          return null;
                        },
                        onSaved: (newPassword) {
                          newPassword2 = newPassword!;
                        },
                        obscureText: hidePassword,
                      ),
                    ],
                  ),
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
