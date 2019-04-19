import 'package:flutter/material.dart';
import "../../components/components.dart";
import "../../common/common.dart";
import "../../app/app.dart";

class LoginScreen extends StatelessWidget {
  final loginForm = LoginForm();

  buildForm() {
    return loginForm;
  }

  onSubmit() {
    if (loginForm.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            buildForm(),
            RaisedButton(
              onPressed: () {
                Loading(context: context).show();
                // showToast(context, "title", "message");
                // OverlayState overlayState = Overlay.of(context);
                // overlayState
                //     .insert(OverlayEntry(builder: (BuildContext context) {
                //   return Toast(
                //     message: "Message",
                //     title: "Title",
                //   );
                // }));
                // Navigator.of(context)
                //     .overlay
                //     .insert(OverlayEntry(builder: (BuildContext context) {
                //   return Toast();
                // }));
              },
              child: Text("Submmit"),
            )
          ],
        ),
      ),
    );
  }
}
