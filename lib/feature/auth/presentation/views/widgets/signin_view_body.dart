import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import 'signin_view_body_form.dart';

class SigninViewBody extends StatelessWidget {
  const SigninViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: SingleChildScrollView(
        child: SigninViewBodyForm(),
      ),
    );
  }
}
