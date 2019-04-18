import 'package:flutter/material.dart';
import '../screens/screens.dart';
import '../assets/assets.dart';
import '../routes/routes.dart';
import '../services/services.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: Assets.theme.themeData(true),
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
  @override
  void initState() {
    super.initState();
    SharedPrefs.init();

    bool _isOK = false;
    createSession().then((isOK) {
      _isOK = isOK;
    });

    Future.delayed(Duration(seconds: 3)).then((v) {
      _decideRoute(_isOK);
    });
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
