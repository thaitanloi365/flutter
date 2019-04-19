import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import '../screens/screens.dart';
import '../assets/assets.dart';
import '../routes/routes.dart';
import '../services/services.dart';
import "../common/common.dart";

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Assets.theme.themeData(),
        onGenerateRoute: (settings) => Routes.generateRoutes(settings),
        home: StartPage());
  }
}

class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();

    final Toast _toast = Toast(
        context: context,
        title: "Network not available",
        message: "Network not available",
        duration: null);

    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      print("ConnectivityResult $result");
      if (result != ConnectivityResult.none) {
        _toast.show();
      } else {
        _toast.hide();
      }
    });

    SharedPrefs.init();
    bool _isOK = false;
    createSession().then((isOK) {
      _isOK = isOK;
    });

    Future.delayed(Duration(seconds: 1)).then((v) {
      _decideRoute(_isOK);
    });
  }

  @override
  dispose() {
    super.dispose();
    SharedPrefs.dispose();
    _subscription.cancel();
  }

  _decideRoute(bool isOK) {
    if (isOK) {
      Navigator.pushReplacementNamed(context, Routes.routeNames.home);
    } else {
      Navigator.pushReplacementNamed(context, Routes.routeNames.login);
    }
  }

  Widget buildSplashScreen(BuildContext context) {
    return Scaffold(
      body: SplashScreen(),
    );
  }

  Widget buildLoginScreen(BuildContext context) {
    return Scaffold(
      body: LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashScreen());
  }
}
