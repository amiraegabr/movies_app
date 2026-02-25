import 'package:flutter/material.dart';
import 'package:movies_app/core/routes/page_route_names.dart';
import 'package:movies_app/modules/auth/register.dart';
import 'package:movies_app/modules/auth/sign_in.dart';
import 'package:movies_app/modules/auth/forgot_password.dart';
import 'package:movies_app/modules/home/home_view.dart';
import 'package:movies_app/modules/onboarding/onboarding_view.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteNames.initial:
      case PageRouteNames.onboarding:
        return MaterialPageRoute(builder: (context) => const OnboardingView());

      case PageRouteNames.signIn:
        return MaterialPageRoute(builder: (context) => const SignIn());

      case PageRouteNames.signUp:
        return MaterialPageRoute(builder: (context) => const Register());

      case PageRouteNames.forgotPassword:
        return MaterialPageRoute(builder: (context) => const ForgotPassword());

      case PageRouteNames.home:
        return MaterialPageRoute(builder: (context) => const HomeView());

      default:
        return MaterialPageRoute(builder: (context) => const HomeView());
    }
  }
}
