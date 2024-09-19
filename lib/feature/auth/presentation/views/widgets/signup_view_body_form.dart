import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper_functions/build_error_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/password_field.dart';
import '../../cubits/signup_cubits/signup_cubit.dart';
import 'have_an_account_widget.dart';
import 'terms_and_conditions.dart';

class SginupViewBodyForm extends StatefulWidget {
  const SginupViewBodyForm({
    super.key,
  });

  @override
  State<SginupViewBodyForm> createState() => _SginupViewBodyFormState();
}

class _SginupViewBodyFormState extends State<SginupViewBodyForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email, userName, password;
  late bool isTermsAccepted = false;
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
                userName = value!;
              },
              hintText: "الاسم كامل",
              textInputType: TextInputType.name),
          const SizedBox(
            height: 16,
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
          TermsAndConditionsWidget(
            onChanged: (value) {
              isTermsAccepted = value;
            },
          ),
          const SizedBox(
            height: 33,
          ),
          CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  if (isTermsAccepted) {
                    context.read<SignupCubit>().createUserWithEmailAndPassword(
                        email, password, userName);
                  } else {
                    buildErrorBar(context, "يجب الموافقة على الشروط والأحكام");
                  }
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
              },
              text: "إنشاء حساب جديد"),
          const SizedBox(
            height: 33,
          ),
          const HaveAnAccountWidget(),
          const SizedBox(
            height: 33,
          ),
        ],
      ),
    );
  }
}
