import 'package:flutter/material.dart';

class AppProvider extends StatefulWidget {
  final Widget child;

  const AppProvider({Key key, this.child}) : super(key: key);

  @override
  _AppProviderState createState() => _AppProviderState();

  static of(BuildContext context) {}
}

class _AppProviderState extends State<AppProvider> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _AppInheritedProvider extends InheritedWidget {
  final Function showLoading;
  final Function hideLoading;
  final Function showAlert;
  final Function showToast;
  final Function hideToast;

  static _AppInheritedProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(_AppInheritedProvider);
  }

  _AppInheritedProvider(
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
