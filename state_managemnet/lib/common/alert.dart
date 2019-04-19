import 'package:flutter/material.dart';

// enum AlertResult { Cancel, Ok }

// typedef AlertCallback = void Function(AlertResult result);

// showAlert(BuildContext context, String message,
//     {String title = null, AlertCallback onClose = null}) {
//   _dissmiss() {
//     Navigator.of(context).pop();
//   }

//   Widget cancelButton = FlatButton(
//     child: Text("Cancel"),
//     onPressed: () {
//       _dissmiss();
//       if (onClose != null) {
//         onClose(AlertResult.Cancel);
//       }
//     },
//   );

//   Widget continueButton = FlatButton(
//     child: Text("OK"),
//     onPressed: () {
//       _dissmiss();
//       if (onClose != null) {
//         onClose(AlertResult.Ok);
//       }
//     },
//   );

//   AlertDialog alert = AlertDialog(
//     title: title != null ? Text(title) : null,
//     content: Text(message),
//     actions: [
//       cancelButton,
//       continueButton,
//     ],
//   );

//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

import 'package:flutter/widgets.dart';
import "modalBase.dart";

class Alert extends ModalBase {
  final String title;
  final String message;
  final VoidCallback onOK;
  final VoidCallback onCancel;

  Alert(
      {@required BuildContext context,
      @required this.message,
      this.title,
      this.onOK,
      this.onCancel})
      : super(context: context, animationType: AnimationType.Grow);

  @override
  show() {
    return super.show();
  }

  buildOkButton() {
    return FlatButton(
      child: Text("OK"),
      onPressed: () {
        hide();
        if (onOK != null) {
          onOK();
        }
      },
    );
  }

  buildCancelButton() {
    if (onCancel == null) {
      return null;
    }

    return FlatButton(
      child: Text("OK"),
      onPressed: () {
        hide();
        onCancel();
      },
    );
  }

  buildAlert() {
    return AlertDialog(
      title: title != null ? Text(title) : null,
      content: Text(message),
      actions: [
        buildOkButton(),
        buildCancelButton(),
      ],
    );
  }

  @override
  Widget dialogBuilder() {
    return buildAlert();
  }
}
