import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/utlis/app_images.dart';
import 'package:fruit_e_commerce/feature/auth/presentation/views/signin_view.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';
import '../../../../on_boarding/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNaviagtion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.imagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(
          Assets.imagesSplashBottom,
        ),
      ],
    );
  }

  void excuteNaviagtion() {
    //  bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
    // Future.delayed(const Duration(seconds: 3), () {
    //   if (isOnBoardingViewSeen) {
    //     var isLoggedIn = FirebaseAuthService().isLoggedIn();

    //     if (isLoggedIn) {
    //       Navigator.pushReplacementNamed(context, HomeView.routeName);
    //     } else {
    //       Navigator.pushReplacementNamed(context, SigninView.routeName);
    //     }
    //   } else {
    // Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    //   }
    // });
    bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (isOnBoardingViewSeen) {
          Navigator.pushReplacementNamed(context, SigninView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        }
      },
    );
  }
}
