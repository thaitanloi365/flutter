import 'package:flutter/material.dart';
import '../utils/utils.dart';

class LoginFormData {
  String username = '';
  String password = '';
}

class LoginForm extends StatefulWidget {
  final _loginFormKey = GlobalKey<FormState>();
  final _loginFormData = LoginFormData();

  bool validate() {
    final form = _loginFormKey.currentState;
    final valid = form.validate();
    if (valid) {
      _loginFormKey.currentState.save();
    }
    return valid;
  }

  LoginFormData get formData => _loginFormData;

  GlobalKey<FormState> get formKey => _loginFormKey;

  @override
  State<StatefulWidget> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  buildUsernameInput() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Username"),
      validator: validateEmail,
      onSaved: (value) {
        widget._loginFormData.username = value;
      },
    );
  }

  buildPasswordInput() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Password"),
      obscureText: true,
      validator: validatePassword,
      onSaved: (value) {
        widget._loginFormData.password = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._loginFormKey,
      child: Column(
        children: <Widget>[
          buildUsernameInput(),
          buildPasswordInput(),
        ],
      ),
    );
  }

  String validatePassword(String email) {
    if (email.isEmpty) {
      return "Password can't empty";
    }

    return null;
  }

  String validateEmail(String email) {
    if (email.isEmpty) {
      return "Email can't empty";
    }
    if (!isEmail(email)) {
      return "Email not valid";
    }
    return null;
  }
}
