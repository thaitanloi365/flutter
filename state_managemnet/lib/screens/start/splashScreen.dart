import 'package:flutter/widgets.dart';
import '../../assets/assets.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(Assets.images.splashScreen, fit: BoxFit.fill),
    );
  }
}
