import 'package:flutter/material.dart';
import 'package:scanner_app/ui%20screens/EventLists.dart';

import '../routes/routes.dart';
import '../ui screens/LoginScreen/login_screen.dart';
import '../ui screens/splash_screen.dart';


class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutePath.SPLASH_SCREEN:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutePath.LOGIN_SCREEN:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutePath.EVENT_LISTS:
        return MaterialPageRoute(builder: (_) => const EventsLists());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    

        }}}