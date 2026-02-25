import 'package:flutter/material.dart';
import 'package:movies_app/core/routes/page_route_names.dart';
import 'package:movies_app/modules/auth/sign_in.dart';

import '../../modules/auth/forgot_password.dart';
import '../../modules/home/home_view.dart';
import '../../modules/onboarding/onboarding_view.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteNames.initial:
        return MaterialPageRoute(builder: (context) => OnboardingView());

      case PageRouteNames.onboarding:
        return MaterialPageRoute(builder: (context) => OnboardingView());

      case PageRouteNames.signIn:
        return MaterialPageRoute(builder: (context) => SignIn());

      case PageRouteNames.forgotPassword:
        return MaterialPageRoute(builder: (context) => ForgotPassword());

      case PageRouteNames.home:
        return MaterialPageRoute(builder: (context) => HomeView());

      default:
        return MaterialPageRoute(builder: (context) => HomeView());
    }
  }
}
