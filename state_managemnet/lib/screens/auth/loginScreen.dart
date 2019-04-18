import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  buildTitle() {
    return Text("Login Screen !");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: <Widget>[
          buildTitle(),
          buildUsernameInput(),
          buildPasswordInput()
        ],
      )),
    );
  }
}
