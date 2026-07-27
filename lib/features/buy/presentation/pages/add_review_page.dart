import 'package:big_cart/core/colors.dart';
import 'package:big_cart/core/fonts.dart';
import 'package:big_cart/core/widgets/green_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar_plus/flutter_rating_bar_plus.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class AddReviewPage extends StatelessWidget {
  //final formKey = GlobalKey();
  const AddReviewPage({super.key});
  @override
  Widget build(BuildContext context) {
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
          'Reviews',
          style: Fonts.titleBold(size: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.all(30),
              child: Form(
                //key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20.h,

                  children: [
                    Text(
                      'What do you think?',
                      style: Fonts.titleBold(size: 20),
                    ),
                    Text(
                      'Please rate this product by clicking on the stars below',
                      textAlign: TextAlign.center,
                      style: Fonts.paragraphRegular(),
                    ),
                    RatingBarIndicator(
                      rating: 3.6, // from backend
                      itemCount: 5,
                      itemSize: 50.w,
                      itemBuilder: ((context, index) => Icon(
                        Icons.star,
                        color: Color(0xFFFFC107),
                      )),
                    ),
                    Stack(
                      children: [
                        TextFormField(
                          maxLines: null,
                          minLines: 4,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.backgroundPrimary,
                            prefixIcon: Icon(
                              Icons.edit_outlined,
                              color: Colors.transparent,
                            ),
                            hint: Text(
                              'Tell us your experience',
                              style: Fonts.paragraphRegular(),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 15.h,
                          left: 15.w,
                          child: Icon(
                            Icons.edit,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: GreenGradientButton(onClick, 'Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
