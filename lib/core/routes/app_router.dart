import 'package:flutter/material.dart';
import 'package:movies_app/core/routes/page_route_names.dart';

import '../../modules/home/home_view.dart';
import '../../modules/onboarding/onboarding_view.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteNames.initial:
        return MaterialPageRoute(builder: (context) => OnboardingView());

      case PageRouteNames.onboarding:
        return MaterialPageRoute(builder: (context) => OnboardingView());

      case PageRouteNames.home:
        return MaterialPageRoute(builder: (context) => HomeView());

      default:
        return MaterialPageRoute(builder: (context) => HomeView());
    }
  }
}
