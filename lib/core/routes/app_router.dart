import 'package:flutter/material.dart';
import 'package:movies_app/core/routes/page_route_names.dart';
import 'package:movies_app/modules/auth/register.dart';
import 'package:movies_app/modules/auth/sign_in.dart';
import 'package:movies_app/modules/profile/profile_view.dart';

import '../../modules/auth/forgot_password.dart';
import '../../modules/explore/explore_view.dart';
import '../../modules/home/home_view.dart';
import '../../modules/layout_view/layout_view.dart';
import '../../modules/onboarding/onboarding_view.dart';
import '../../modules/profile/update_profile.dart';
import '../../modules/search/search_view.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteNames.initial:
        return MaterialPageRoute(builder: (context) => OnboardingView());

      case PageRouteNames.onboarding:
        return MaterialPageRoute(builder: (context) => OnboardingView());

      case PageRouteNames.signIn:
        return MaterialPageRoute(builder: (context) => SignIn());

      case PageRouteNames.signUp:
        return MaterialPageRoute(builder: (context) => Register());

      case PageRouteNames.forgotPassword:
        return MaterialPageRoute(builder: (context) => ForgotPassword());

      case PageRouteNames.layoutView:
        return MaterialPageRoute(builder: (context) => LayoutView());

      case PageRouteNames.home:
        return MaterialPageRoute(builder: (context) => HomeView());

      case PageRouteNames.search:
        return MaterialPageRoute(builder: (context) => SearchView());

      case PageRouteNames.explore:
        return MaterialPageRoute(builder: (context) => ExploreView());

      case PageRouteNames.profile:
        return MaterialPageRoute(builder: (context) => ProfileView());

      case PageRouteNames.updateProfile:
        return MaterialPageRoute(builder: (context) => UpdateProfile());

      default:
        return MaterialPageRoute(builder: (context) => HomeView());
    }
  }
}
