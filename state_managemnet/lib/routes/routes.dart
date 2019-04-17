import 'package:flutter/material.dart';
import "transition.dart";
import '../screens/screens.dart';

const String _splashScreen = '/splashScreen';
const String _home = '/home';
const String _login = '/login';

class Routes {
  Routes._();
  static final Routes _routes = new Routes._();
  factory Routes() => _routes;

  static final _RouteNames routeNames = new _RouteNames();

  static initialRoute() {}

  static generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case _splashScreen:
        return PageTransition(child: SplashScreen());
      case _home:
        return PageTransition(child: HomeScreen());
      case _login:
        return PageTransition(child: LoginScreen());
        break;
    }
  }

  static generateUnkownRoute(RouteSettings settings) {
    return PageTransition(child: UnknownScreen());
  }
}

class _RouteNames {
  _RouteNames._();
  static final _RouteNames _routeNames = new _RouteNames._();
  factory _RouteNames() => _routeNames;

  final String splashScreen = _splashScreen;
  final String home = _home;
  final String login = _login;
}
