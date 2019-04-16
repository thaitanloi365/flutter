import 'package:flutter/material.dart';

enum AlertResult { Cancel, Ok }

typedef AlertCallback = void Function(AlertResult result);

showAlert(
    {@required BuildContext context,
    @required String message,
    // ignore: AVOID_INIT_TO_NULL
    String title = null,
    // ignore: AVOID_INIT_TO_NULL
    AlertCallback onClose = null}) {
  // set up the buttons
  _dissmiss() {
    Navigator.of(context).pop();
  }

  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () {
      _dissmiss();
      if (onClose != null) {
        onClose(AlertResult.Cancel);
      }
    },
  );

  Widget continueButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      _dissmiss();
      if (onClose != null) {
        onClose(AlertResult.Ok);
      }
    },
  );

  AlertDialog alert = AlertDialog(
    title: title != null ? Text(title) : null,
    content: Text(message),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
