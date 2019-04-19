import 'package:flutter/material.dart';
import '../screens/screens.dart';
import '../assets/assets.dart';
import '../routes/routes.dart';
import '../services/services.dart';
import "../common/common.dart";

class AppContext extends InheritedWidget {
  final Function showLoading;
  final Function hideLoading;
  final Function showAlert;
  final Function showToast;
  final Function hideToast;

  static AppContext of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppContext);
  }

  AppContext(
      {Key key,
      @required Widget child,
      @required this.showLoading,
      @required this.hideLoading,
      @required this.showAlert,
      @required this.showToast,
      @required this.hideToast})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  final Toast toast = Toast();
  showAlert(BuildContext context) {
    print("_showAlert context $context");
  }

  showLoading(BuildContext context) {
    print("_showAlert context $context");
  }

  hideLoading(BuildContext context) {}

  showToast(BuildContext context) {}

  hideToast(BuildContext context) {}
  @override
  Widget build(BuildContext context) {
    return AppContext(
        child: MaterialApp(
            theme: Assets.theme.themeData(true),
            onGenerateRoute: (settings) => Routes.generateRoutes(settings),
            home: StartPage()));
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

    Future.delayed(Duration(seconds: 1)).then((v) {
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
