import 'package:flutter/material.dart';

enum AlertResult { Cancel, Ok }

typedef AlertCallback = void Function(AlertResult result);

showAlert(BuildContext context, String message,
    {String title = null, AlertCallback onClose = null}) {
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
