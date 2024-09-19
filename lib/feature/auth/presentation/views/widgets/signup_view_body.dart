import 'package:flutter/material.dart';

import '../../../../../constants.dart';

import 'signup_view_body_form.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: SingleChildScrollView(
        child: SginupViewBodyForm(),
      ),
    );
  }
}
