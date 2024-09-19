import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/feature/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruit_e_commerce/feature/auth/presentation/views/widgets/signin_view_body_bloc_consumer.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../domain/repos/auth_repo.dart';

// class SigninView extends StatelessWidget {
//   const SigninView({super.key});

//   static const routeName = 'login';
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SigninCubit(
//         getIt.get<AuthRepo>(),
//       ),
// child: Scaffold(
//   appBar: buildAppBar(context, title: 'تسجيل دخول'),
//   body: const SigninViewBodyBlocConsumer(),
// ),
//     );
//   }
// }

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const routeName = 'signin';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
          appBar: buildAppBar(context, title: "تسجيل دخول"),
          body: const SigninViewBodyBlocConsumer()),
    );
  }
}
