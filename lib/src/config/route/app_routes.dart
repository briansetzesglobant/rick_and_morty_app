import 'package:flutter/material.dart';
import '../../core/util/routes_constants.dart';
import '../../core/util/strings_constants.dart';
import '../../presentation/view/home_page.dart';
import '../../presentation/view/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstants.splashScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case RoutesConstants.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomePage(
            title: StringsConstants.homePageTitle,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                StringsConstants.appRouteDefault,
              ),
            ),
          ),
        );
    }
  }
}
