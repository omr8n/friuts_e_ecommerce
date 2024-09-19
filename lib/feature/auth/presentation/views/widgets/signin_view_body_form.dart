import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/utlis/app_images.dart';
import 'package:fruit_e_commerce/core/widgets/password_field.dart';

import '../../../../../core/utlis/app_colors.dart';
import '../../../../../core/utlis/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../cubits/signin_cubit/signin_cubit.dart';
import 'dont_have_account_widget.dart';
import 'or_divider.dart';
import 'social_login_button.dart';

class SigninViewBodyForm extends StatefulWidget {
  const SigninViewBodyForm({
    super.key,
  });

  @override
  State<SigninViewBodyForm> createState() => _SigninViewBodyFormState();
}

class _SigninViewBodyFormState extends State<SigninViewBodyForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          CustomTextFormField(
              onSaved: (value) {
                email = value!;
              },
              hintText: "البريد الإلكتروني",
              textInputType: TextInputType.emailAddress),
          const SizedBox(
            height: 16,
          ),
          PasswordField(
            onSaved: (value) {
              password = value!;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('نسيت كلمة المرور؟',
                  style: TextStyles.semiBold13
                      .copyWith(color: AppColors.lightPrimaryColor)),
            ],
          ),
          const SizedBox(
            height: 33,
          ),
          CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  context.read<SigninCubit>().signin(email, password);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              text: "تسجيل دخول"),
          const SizedBox(
            height: 33,
          ),
          const DontHaveAnAccountWidget(),
          const SizedBox(
            height: 33,
          ),
          const OrDivider(),
          const SizedBox(
            height: 33,
          ),
          SocialLoginButton(
              image: Assets.imagesGoogleIcon,
              title: "تسجيل بواسطة جوجل",
              onPressed: () {
                context.read<SigninCubit>().signinWithGoogle();
              }),
          const SizedBox(
            height: 16,
          ),
          SocialLoginButton(
              image: Assets.imagesApplIcon,
              title: "تسجيل بواسطة أبل",
              onPressed: () {}),
          const SizedBox(
            height: 16,
          ),
          SocialLoginButton(
              image: Assets.imagesFacebookIcon,
              title: "تسجيل بواسطة فيسبوك",
              onPressed: () {
                //  context.read<SigninCubit>().signinWithFacebook();
              }),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
