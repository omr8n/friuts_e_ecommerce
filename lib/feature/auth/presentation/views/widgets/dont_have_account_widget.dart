import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/feature/auth/presentation/views/signup_view.dart';

import '../../../../../core/utlis/app_colors.dart';
import '../../../../../core/utlis/app_text_styles.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'لا تمتلك حساب  ؟',
            style: TextStyles.semiBold16.copyWith(
              color: const Color(0xFF949D9E),
            ),
          ),
          TextSpan(
              text: ' ',
              style: TextStyles.semiBold16.copyWith(
                color: const Color(0xFF616A6B),
              )),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, SignupView.routeName);
                },
              text: 'قم بإنشاء حساب ',
              style: TextStyles.semiBold16
                  .copyWith(color: AppColors.primaryColor)),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
