import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/feature/auth/presentation/views/signup_view.dart';
import 'package:fruit_e_commerce/feature/splash/presentation/views/splash_view.dart';

import '../../feature/auth/presentation/views/signin_view.dart';
import '../../feature/home/presentation/views/home_view.dart';
import '../../feature/on_boarding/presentation/views/on_boarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  // switch (settings.name) {
  // case SplashView.routeName:
  //   return MaterialPageRoute(builder: (context) => const SplashView());
  //   case BestSellingView.routeName:
  //     return MaterialPageRoute(builder: (context) => const BestSellingView());
  //   case SigninView.routeName:
  //     return MaterialPageRoute(builder: (context) => const SigninView());
  //   case SignupView.routeName:
  //     return MaterialPageRoute(builder: (context) => const SignupView());

  // default:
  //   return MaterialPageRoute(builder: (context) => const Scaffold());
  // }
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => const SigninView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
